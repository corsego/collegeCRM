class Course < ApplicationRecord
  belongs_to :user
  belongs_to :classroom
  belongs_to :service
  has_many :lessons

  include Schedulable
  
  def schedule
    schedule = IceCube::Schedule.new(now = self.start_time&.to_datetime)
    schedule.add_recurrence_rule(
      IceCube::Rule.weekly.day(active_days)
    )
    schedule
  end

  def to_s
    id
  end
  
end
