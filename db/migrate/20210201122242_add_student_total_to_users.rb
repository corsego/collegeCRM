class AddStudentTotalToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :student_total, :integer, default: 0, null: false
  end
end
