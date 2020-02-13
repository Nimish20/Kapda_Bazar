class Product < ApplicationRecord
  has_many :order_lines
  has_many :orders, through: :order_lines
  belongs_to :store

  validates :name, :size, :price, :rent_cost, presence: true
end
