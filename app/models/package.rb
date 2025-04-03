class Package < ApplicationRecord
	has_one_attached :thumbnail
	validates :package_name, presence: true
	validates :package_price, presence: true
    validates :description, presence: true
	belongs_to :service
	has_one :cart
end
