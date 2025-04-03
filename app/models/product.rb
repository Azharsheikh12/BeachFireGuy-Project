class Product < ApplicationRecord
	has_one_attached :thumbnail
	validates :item, presence: true
	validates :price, presence: true
    validates :duration, presence: true
    validates :thumbnail, presence: true
	# validates :quantity, presence: true
	has_many :items, dependent: :destroy


end
	