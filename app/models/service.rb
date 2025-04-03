class Service < ApplicationRecord
	has_many :packages
	has_many :product_addons
end
