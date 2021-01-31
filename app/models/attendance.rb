class Attendance < ApplicationRecord

  belongs_to :user
  belongs_to :lesson

  validates :status, presence: true

  STATUSES = [:planned, :attended, :not_attended, :a, :b, :c, :d, :e, :f]
  def self.statuses
    STATUSES.map { |status| [status, status] }
  end

  def to_s
    user
  end

end