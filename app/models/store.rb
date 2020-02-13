class Store < ApplicationRecord
  has_many :delivery_boys, dependent: :destroy

  validates :password, confirmation: true, length: { in: 6..20 }
  validates :password_confirmation, presence: true
  validates :name, uniqueness: true

end
