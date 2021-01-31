class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :lesson, null: false, foreign_key: true
      t.string :status, default: "planned"

      t.timestamps
    end
  end
end
