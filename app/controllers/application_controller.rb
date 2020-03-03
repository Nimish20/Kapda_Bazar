class ApplicationController < ActionController::Base
  PER_PAGE = 12

  helper_method :current_cart

  def after_sign_in_path_for(resource)
    if resource.class == Seller
      seller_products_path(current_seller)
    else
      market_places_path
    end
  end

  def after_inactive_sign_up_path_for(resource)
    if resource.class == Seller
      seller_products_path(current_seller)
    else
      market_places_path
    end
  end

 
  def current_cart
    current_customer.carts.last
  end

end
