class AddQuantityToPromoCode < ActiveRecord::Migration[7.0]
  def change
    add_column :promo_codes, :quantity, :integer, default: 0
    
  end
end
