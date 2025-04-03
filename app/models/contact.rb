class Contact < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, format: Devise.email_regexp
    validates :subject, presence: true
    validates :message, presence: true
end
