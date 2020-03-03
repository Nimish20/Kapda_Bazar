class Customer < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :orders, dependent: :destroy
  has_many :carts
  validates :name, :address, :postal_code, :gender, :number, presence: true
  validates :postal_code, exclusion: { in: 452001..452020, message: "%{value} is not valid pincode" }
  validates :number, uniqueness: true, length: { is: 10 }
end
