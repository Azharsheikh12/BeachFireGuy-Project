class ServiceLocation < ApplicationRecord
  include Geocoder
  has_one :cart
  has_many_attached :thumbnails
  geocoded_by :full_address

  after_validation :geocode

  def full_address
    "#{location_name}, #{location_details}"
  end
  validates :location_name, presence: true
  validates :location_details, presence: true
  # validates :thumbnail, presence: true

  enum :setup_time_slot, [ "12:00 pm - 12:30 pm","1:00 pm - 1:30 pm","2:00 pm - 2:30 pm","3:00 pm - 3:30 pm","4:00 pm - 4:30 pm","5:00 pm - 5:30 pm","6:00 pm - 6:30 pm","7:00 pm - 7:30 pm" ]

  def display_name
    location_name
  end
end

