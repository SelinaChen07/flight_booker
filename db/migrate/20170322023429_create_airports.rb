class CreateAirports < ActiveRecord::Migration[5.0]
  def change
    create_table :airports do |t|
      t.string :city
      t.string :airport_code

      t.timestamps
    end
    add_index :airports, :city
    add_index :airports, :airport_code, unique: true
  end
end
