class RemoveUserFromCart < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :user_id
  end
end
