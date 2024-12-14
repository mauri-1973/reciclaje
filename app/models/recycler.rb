class Recycler < ApplicationRecord

    has_many :materials, dependent: :destroy
    has_many :deliveries, dependent: :destroy
    validates :name, :phone, :address, :email, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'debe ser un correo válido' }
    validates :email, uniqueness: { case_sensitive: false, message: 'ya está registrado' }
end
