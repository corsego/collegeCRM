class RenameServiceClientPriceToStudentPrice < ActiveRecord::Migration[6.1]
  def change
    rename_column :services, :client_price, :student_price
    change_column_null :services, :student_price, false
    change_column_default :services, :student_price, 0
  end
end
