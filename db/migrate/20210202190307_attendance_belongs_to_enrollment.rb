class AttendanceBelongsToEnrollment < ActiveRecord::Migration[6.1]
  def change
    add_reference :attendances, :enrollment, foreign_key: true
  end
end
