class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.float :total_amount
      t.string :payment_mode
      t.string :payment_status
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
