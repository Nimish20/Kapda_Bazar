class Store < ApplicationRecord
  validates :password, confirmation: true, length: { in: 6..20 }
  validates :password_confirmation, presence: true
  validates :name, uniqueness: true

end
