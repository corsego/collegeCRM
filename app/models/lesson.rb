class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :classroom
  belongs_to :course
  
  validates :status, :start, presence: true

  STATUSES = [:planned, :confirmed, :cancelled]
  def self.statuses
    STATUSES.map { |status| [status, status] }
  end

end
