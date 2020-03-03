class DeliveryBoys::RegistrationsController < ApplicationController

  def new
    @delivery_boy = DeliveryBoy.new
  end

  def create
    @delivery_boy = DeliveryBoy.new(delivery_boy_params)
    if @delivery_boy.save
      DeliveryBoyMailer.with(delivery_boy: @delivery_boy).welcome_email.deliver_later
      flash[:primary] = "Delivery Person added Succesfully"
      redirect_to seller_products_path
    end
  end

  def edit
    @delivery_boy = DeliveryBoy.find(params[:id])
  end

  def update
    @delivery_boy = DeliveryBoy.find(params[:id])
    if @delivery_boy.update(update_params)
      flash[:primary] = "details updated"
      redirect_to delivery_boys_orders_path
    else
      flash[:alert] = @delivery_boy.errors.full_messages.join("<br></li><li>").html_safe
      render 'edit'
    end
  end
 
  private

  def delivery_boy_params
    params.require(:delivery_boy).permit(:name, :store_id, :address, :phone_number, :email, :password)
  end

  def update_params
    params.require(:delivery_boy).permit(:name, :address, :phone_number, :email, :password)
  end
end
