class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :delivery_boy
  belongs_to :cart

  before_validation :assign_delivery_boy, on: :create
  before_create :set_values
 
  private

  def assign_delivery_boy
     delivery_boy = DeliveryBoy.where(store_id: cart.store.id)
                               .order(Arel.sql('RANDOM()')).first
     self.delivery_boy_id = delivery_boy.id
  end
  
  def set_values
    self.status = "processing" 
    self.payment_status ="Pending"
    self.order_date = Date.today
    self.time_period = (Date.today..Date.today+7.day)
  end
end
