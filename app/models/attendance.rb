class Attendance < ApplicationRecord

  belongs_to :user, touch: true
  belongs_to :lesson

  validates :status, presence: true
  # user can not attend the same lesson twice
  validates_uniqueness_of :user_id, scope: :lesson_id
  validates_uniqueness_of :lesson_id, scope: :user_id 

  monetize :student_price_start, as: :student_price_start_cents
  monetize :student_price_final, as: :student_price_final_cents

  STATUSES = [:planned, :attended, :not_attended]
  def self.statuses
    STATUSES.map { |status| [status, status] }
  end

  def to_s
    user
  end

  after_create do
    update_column :student_price_start, lesson.course.service.client_price
  end

  after_save do
    if status == "planned"
      update_column :student_price_final, 0
    elsif status == "attended"
      update_column :student_price_final, student_price_start
    elsif status == "not_attended"
      update_column :student_price_final, 0
    end
  end

  validate :can_not_attend_own_course_or_lesson
  def can_not_attend_own_course_or_lesson
    if user_id.present?
      if user_id == lesson.user_id || user_id == lesson.course.user_id
        errors.add(:user_id, "can not attend own course or lesson")
      end
    end
  end

end