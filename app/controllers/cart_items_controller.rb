class CartItemsController < ApplicationController

  def index
    @cart_item = current_cart.cart_items
  end

  def create
    if params[:empty_cart_items]
      current_cart.cart_items.destroy_all
    end
    @cart_item = current_cart.cart_items.new(cart_item_params)
    if @cart_item.save
      flash[:primary] = "Product added to the cart"
      redirect_to '/market_places/' + params[:product_id]
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path  
  end

  private
    def cart_item_params
      params.permit(:product_name,:price,:rent_cost,:product_id)
    end
end
