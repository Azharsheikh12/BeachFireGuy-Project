class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.integer :country_code
      t.string :steet_address
      t.string :closest_steet_address
      t.string :total_guests
      t.string :company_name
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :additional_notes
      t.references :location, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
