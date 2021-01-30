class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.references :user, null: false, foreign_key: true
      t.belongs_to :classroom, null: false, foreign_key: true
      t.belongs_to :course, null: false, foreign_key: true
      t.string :status
      t.datetime :start

      t.timestamps
    end
  end
end
