class DeliveryBoy < ApplicationRecord
  has_many :orders
  belongs_to :store

  validates :name, :address, :phone_number, :email, :password, presence: true
  validates :password, length: { in: 6..20 }
  validates :phone_number, uniqueness: true, length: { is: 10 }
  validates :email, uniqueness: true

end
