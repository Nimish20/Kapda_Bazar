class Customers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]

  def new
    @customer = Customer.new
  end

  def create
      super
      resource.carts.create
  end

  protected

  def sign_up_params
    params.require(:customer).permit(:email, :password, :password_confirmation, 
      :name, :address, :number, :postal_code, :gender)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :number, :address, :postal_code, :gender])
  end

  def after_update_path_for(resource)
    sign_in_after_change_password? ? products_path(current_customer) : new_customer_session_path
  end

  private

  def sign_in_after_change_password?
    account_update_params[:password].blank?
  end

end
