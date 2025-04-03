class AddPromoCodeInUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :coupon_code, :string
  end
end
