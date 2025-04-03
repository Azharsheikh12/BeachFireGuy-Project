class Item < ApplicationRecord
    belongs_to :product, optional: true
    belongs_to :product_addon, optional: true
    belongs_to :cart

  end
  