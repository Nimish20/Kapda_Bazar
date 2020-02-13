class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :delivery_boy
  has_many :order_lines
  has_many :products, through: :order_lines

end
