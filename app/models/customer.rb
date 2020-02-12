class Customer < ApplicationRecord
  validates :name, :address, :email, :postal_code, :gender, :password,
            :number, presence: true
  validates :email, uniqueness: true
  validates :number, uniqueness: true, lenght: { is: 10 }
  validates :password, confirmation: true, length: { in: 6..20 }
  validates :password_confirmation, presence: true

end
