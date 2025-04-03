class AddServiceToPackages < ActiveRecord::Migration[7.0]
  def change
    add_reference :packages, :service, null: true, foreign_key: true
    add_reference :packages, :service_location, null: true, foreign_key: true

  end
end
