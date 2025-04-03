class CreateServiceLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :service_locations do |t|
      t.string :location_name
      t.string :location_details
      t.text :thumbnail
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
