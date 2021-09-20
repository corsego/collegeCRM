# frozen_string_literal: true

class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :lessons, dependent: :restrict_with_error # works better with custom validator
  # has_many :lessons

  # user can not be enrolled to the same course twice
  validates :user_id, uniqueness: { scope: :course_id }
  validates :course_id, uniqueness: { scope: :user_id }

  def to_s
    id
  end

  # validate :can_not_be_enrolled_in_own_course
  # def can_not_be_enrolled_in_own_course
  #  if user_id.present?
  #    if user_id == course.user_id
  #      errors.add(:user_id, "can not be enrolled in own course")
  #    end
  #  end
  # end
end
