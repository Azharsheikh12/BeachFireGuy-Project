class Gallery < ApplicationRecord
    has_one_attached :thumbnail 
    validates :picture_name, presence: true
    validates :thumbnail, presence: true
end
