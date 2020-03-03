class OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
  end

  def new
    @order = current_customer.orders.new
  end

  def create
    if order_params[:payment_mode] == "online"
      redirect_to "https://www.paypal.com/signin"
    else
      @order = current_customer.orders.new(order_params.merge(cart_id: current_cart.id))
      if @order.save
        current_customer.carts.last.update(status: "ordered")
        current_customer.carts.create
        redirect_to market_places_path
      else
        flash[:alert] = @order.errors.full_messages
        render 'new'
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_mode, :total_rent, :refund_amount, :total_amount)
  end
end
