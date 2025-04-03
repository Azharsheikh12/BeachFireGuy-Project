class AddSetupTimeAndSetupTimeSlotToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :setup_time, :datetime
    add_column :orders, :setup_time_slot, :string
  end
end
