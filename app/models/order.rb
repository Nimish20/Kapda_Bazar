class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :delivery_boy

end
