class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    # devise :database_authenticatable,
    #        :recoverable, :rememberable, :validatable

    # self.table_name = :admin_users
    # belongs_to :role, class_name: 'BxBlockRolesPermissions::Role'

    # def is_admin?
    #   self.role.name == 'Super admin'
    # end
end
