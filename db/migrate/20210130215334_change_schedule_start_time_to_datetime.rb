class ChangeScheduleStartTimeToDatetime < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :start_time
    add_column :courses, :start_time, :datetime
  end
end
