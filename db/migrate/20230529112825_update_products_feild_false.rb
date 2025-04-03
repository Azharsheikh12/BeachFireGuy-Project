class UpdateProductsFeildFalse < ActiveRecord::Migration[7.0]
  def change
      change_column_null :products, :user_id, true
      change_column_null :products, :cart_id, true
  end
end
