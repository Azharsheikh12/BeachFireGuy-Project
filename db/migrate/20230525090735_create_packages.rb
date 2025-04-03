class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :package_name
      t.string :package_price
      t.string :description
      t.string :extra_details

      t.timestamps
    end
  end
end
