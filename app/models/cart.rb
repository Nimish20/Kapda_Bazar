class Cart < ApplicationRecord
  belongs_to :customer
  has_one :order
  has_many :cart_items
  has_many :products, through: :cart_items

  def empty?
    cart_items.empty?
  end

  def store
    cart_items.last.product.store
  end
end
