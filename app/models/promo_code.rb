class PromoCode < ApplicationRecord
	validates :code, presence: true
	validates :discount_percentage, presence: true
end
