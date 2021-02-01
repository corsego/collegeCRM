class Lesson < ApplicationRecord
  belongs_to :user, touch: true
  belongs_to :classroom
  belongs_to :course
  has_many :attendances, inverse_of: :lesson, dependent: :destroy
  accepts_nested_attributes_for :attendances, reject_if: :all_blank, allow_destroy: true
  
  validates :status, :start, presence: true

  STATUSES = [:planned, :confirmed, :cancelled]
  def self.statuses
    STATUSES.map { |status| [status, status] }
  end

  monetize :teacher_price_start, as: :teacher_price_start_cents
  monetize :teacher_price_final, as: :teacher_price_final_cents

  after_create do
    update_column :teacher_price_start, course.service.teacher_price
  end

  after_save do
    if status == "planned"
      update_column :teacher_price_final, 0
    elsif status == "confirmed"
      update_column :teacher_price_final, teacher_price_start
    elsif status == "cancelled"
      update_column :teacher_price_final, 0
    end
  end

end
