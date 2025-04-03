class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :validatable

  has_secure_password :validations => false

    def self.serialize_into_session(record)
      [record.id, record.encrypted_password]
    end

    def self.serialize_from_session(key, salt)
      record = find_by(id: key)
      record if record&.encrypted_password == salt
    end

    self.table_name = :users
    has_many :cart
  	has_many :products
    validates :email, format: Devise.email_regexp
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :closest_steet_address, presence: true
    validates :phone, presence: true
    validates :phone, :numericality => true, allow_blank: true
    validates :phone, :length => { :minimum => 10, :maximum => 10 , :message => "is invalid (minimum is 10 digits)"}, allow_blank: true
    # validates :country_code, presence: true
    # validates :additional_notes, presence: true
    validates :total_guests, presence: true
    # validates :steet_address, presence: true
    # validates :company_name, presence: true
    # validates :city, presence: true
    # validates :state, presence: true
    # validates :zip_code, presence: true
    validates :terms_of_service, acceptance: true

end
	