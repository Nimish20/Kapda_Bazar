class DeliveryBoys::OrdersController < ApplicationController
  def index
    @orders = Order.where(delivery_boy_id: session[:current_delivery_boy]["id"])
  end

  def update
    @order = Order.find(params[:id])
    @order.status = "delivered"    
    @order.payment_status = "Done"
    if @order.save
      redirect_to delivery_boys_orders_path
    else
      flash[:alert] = "Cannot proccess Order"
      redirect_to delivery_boys_orders_path
    end
  end
end
