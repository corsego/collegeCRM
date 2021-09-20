# frozen_string_literal: true

class Attendance < ApplicationRecord
  belongs_to :user, touch: true
  belongs_to :lesson
  # belongs_to :enrollment
  belongs_to :enrollment, optional: true # required false for creation. association is added after_create. not best approach

  validates :status, presence: true
  # user can not attend the same lesson twice
  validates :user_id, uniqueness: { scope: :lesson_id }
  validates :lesson_id, uniqueness: { scope: :user_id }

  monetize :student_price_start, as: :student_price_start_cents
  monetize :student_price_final, as: :student_price_final_cents

  STATUSES = %i[planned attended not_attended].freeze
  def self.statuses
    STATUSES.map { |status| [status, status] }
  end

  def to_s
    user
  end

  after_create do
    update_column :student_price_start, lesson.course.service.student_price
    # update_column :enrollment_id, Enrollment.find_by(user: user, course: lesson.course).id
    update_column :enrollment_id, lesson.course.enrollments.find_by(user: user).id
  end

  after_save do
    case status
    when 'planned'
      update_column :student_price_final, 0
    when 'attended'
      update_column :student_price_final, student_price_start
    when 'not_attended'
      update_column :student_price_final, 0
    end
  end

  validate :can_not_attend_own_course_or_lesson
  def can_not_attend_own_course_or_lesson
    errors.add(:user_id, 'can not attend own course or lesson') if user_id.present? && (user_id == lesson.user_id || user_id == lesson.course.user_id)
  end
end
