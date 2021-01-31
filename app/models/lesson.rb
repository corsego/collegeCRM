class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :classroom
  belongs_to :course
  has_many :attendances, inverse_of: :lesson, dependent: :destroy
  accepts_nested_attributes_for :attendances, reject_if: :all_blank, allow_destroy: true
  
  validates :status, :start, presence: true

  STATUSES = [:planned, :confirmed, :cancelled]
  def self.statuses
    STATUSES.map { |status| [status, status] }
  end

end
