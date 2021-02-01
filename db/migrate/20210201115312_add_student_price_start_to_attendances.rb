class AddStudentPriceStartToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :student_price_start, :integer, default: 0, null: false
  end
end
