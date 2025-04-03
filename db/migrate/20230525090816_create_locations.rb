class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :beach_location
      t.string :beach_fire_location
      t.datetime :setup_time
      t.string :setup_time_slot
      t.references :package, null: false, foreign_key: true

      t.timestamps
    end
  end
end
