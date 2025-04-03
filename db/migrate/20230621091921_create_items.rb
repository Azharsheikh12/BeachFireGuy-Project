class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity, :default => 0
      t.float :price
      t.references :product, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.timestamps
    end
  end
end
