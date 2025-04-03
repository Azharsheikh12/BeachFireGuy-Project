class CreatePromoCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promo_codes do |t|
      t.string :code
      t.float :discount_percentage

      t.timestamps
    end
  end
end
