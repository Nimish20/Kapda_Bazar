class Sellers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]
  
  # GET /resource/sign_up
  def new
    @seller = Seller.new
    @seller.build_store
  end


  protected

  def sign_up_params
    params.require(:seller).permit(:email, :password, :password_confirmation, 
      :first_name, :last_name, :number, store_attributes: [:name, :address])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :number])
  end

  def after_update_path_for(resource)
    sign_in_after_change_password? ? seller_products_path(current_seller) : new_seller_session_path
  end

  private
  def sign_in_after_change_password?
    account_update_params[:password].blank?
  end

end
