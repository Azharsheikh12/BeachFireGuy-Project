class ChangeDtTypeOfGuestTotal < ActiveRecord::Migration[7.0]
  def self.up
    remove_column :users, :total_guests
    add_column :users, :total_guests, :integer
  end
end

