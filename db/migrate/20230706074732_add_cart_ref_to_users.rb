class AddCartRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :cart,foreign_key: true
  end
end
