class AddApprovedInOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :approved, :boolean,  :default => false
  end
end
