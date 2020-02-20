class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    seller_products_path(current_seller)
  end

  def after_inactive_sign_up_path_for(resource)
    seller_products_path(current_seller)
  end

  def after_sign_out_path_for(resource)
    stored_location_for(resource) || new_seller_session_path
  end
end
