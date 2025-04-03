class RemoveLocationsFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :location_id
  end
end
