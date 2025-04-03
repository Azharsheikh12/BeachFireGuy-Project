class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.string :product
      t.float :price
      t.integer :quantity
      t.float :subtotal
      t.float :total
      t.string :coupon
      t.references :user, null: false, foreign_key: true
  
      t.timestamps
    end
  end
end
