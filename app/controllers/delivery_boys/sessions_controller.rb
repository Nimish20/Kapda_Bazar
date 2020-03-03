class DeliveryBoys::SessionsController < ApplicationController

  def new
    if session[:current_delivery_boy] != nil
      redirect_to delivery_boys_orders_path
    end
    unless current_seller.nil? && current_customer.nil? 
      flash[:alert] = "Session Already exist !!! Please Logout previous user first."
      redirect_to "/"  
    end
  end

  def create
    @delivery_boy = DeliveryBoy.where(email: params[:email]).first
    unless @delivery_boy.nil?
      if @delivery_boy.password == params[:password]
        session[:current_delivery_boy] = @delivery_boy
        redirect_to delivery_boys_orders_path
      else
        render 'new'
      end
    end
  end

  def destroy
    session[:current_delivery_boy] = nil
    flash[:notice] = "You have successfully logged out"
    redirect_to '/'
  end

end
