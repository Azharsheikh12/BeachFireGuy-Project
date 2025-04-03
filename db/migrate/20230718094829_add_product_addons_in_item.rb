class AddProductAddonsInItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :items ,:product_addon
    change_column_null :items, :product_id, true

  end
end
