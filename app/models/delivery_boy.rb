class DeliveryBoy < ApplicationRecord
  belongs_to :store

  validates :name, :address, :phone_number, :email, :password, presence: true
  validates :password, confirmation: true, length: { in: 6..20 }
  validates :password_confirmation, presence: true
  validates :phone_number, uniqueness: true, length: { is: 10 }
  validates :email, uniqueness: true

end
