class Product < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many_attached :image
  belongs_to :store
  belongs_to :category

  validates :name, :size, :price, :rent_cost, presence: true
end
