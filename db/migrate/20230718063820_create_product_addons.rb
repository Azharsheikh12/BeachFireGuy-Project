class CreateProductAddons < ActiveRecord::Migration[7.0]
  def change
    create_table :product_addons do |t|
      t.string :item
      t.float :price
      t.string :quantity
      t.string :duration
      t.string :thumbnail
      t.references :service

      t.timestamps
    end
  end
end
