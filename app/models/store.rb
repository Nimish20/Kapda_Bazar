class Store < ApplicationRecord
  has_many :delivery_boys, dependent: :destroy
  has_many :products, dependent: :destroy
  belongs_to :seller

 validates :name, uniqueness: true

end
