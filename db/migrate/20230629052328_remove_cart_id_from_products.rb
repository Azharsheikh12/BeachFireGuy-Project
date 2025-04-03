class RemoveCartIdFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :cart_id, :bigint
    remove_column :products, :user_id, :bigint
  end
end
