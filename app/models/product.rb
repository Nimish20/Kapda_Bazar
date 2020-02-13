class Product < ApplicationRecord
  belongs_to :store

  validates :name, :size, :price, :rent_cost, presence: true
end
