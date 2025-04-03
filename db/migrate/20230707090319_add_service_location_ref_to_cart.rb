class AddServiceLocationRefToCart < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :service_location, foreign_key: true
  end
end
