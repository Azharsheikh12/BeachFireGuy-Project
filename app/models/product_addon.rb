class ProductAddon < ApplicationRecord
	self.table_name = :product_addons
	belongs_to :service
	has_one_attached :thumbnail
	has_many :items, dependent: :destroy
end
