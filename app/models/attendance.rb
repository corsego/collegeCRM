class Attendance < ApplicationRecord

  belongs_to :user
  belongs_to :lesson

  validates :status, presence: true
  # user can not attend the same lesson twice
  validates_uniqueness_of :user_id, scope: :lesson_id
  validates_uniqueness_of :lesson_id, scope: :user_id 

  STATUSES = [:planned, :attended, :not_attended]
  def self.statuses
    STATUSES.map { |status| [status, status] }
  end

  def to_s
    user
  end

end