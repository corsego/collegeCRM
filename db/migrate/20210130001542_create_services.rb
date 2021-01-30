class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :duration
      t.integer :client_price

      t.timestamps
    end
  end
end
