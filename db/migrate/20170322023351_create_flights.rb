class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.references :from_airport, foreign_key: true
      t.references :to_airport, foreign_key: true
      t.string :flight_number
      t.datetime :start_time
      t.integer :duration_in_minutes

      t.timestamps
    end
    add_index :flights, [:from_airport_id, :to_airport_id]
    add_index :flights, [:start_time]
  end
end
