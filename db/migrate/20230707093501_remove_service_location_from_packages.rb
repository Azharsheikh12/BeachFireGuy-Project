class RemoveServiceLocationFromPackages < ActiveRecord::Migration[7.0]
  def change
    remove_reference :packages, :service_location, null: false, foreign_key: true
  end
end
