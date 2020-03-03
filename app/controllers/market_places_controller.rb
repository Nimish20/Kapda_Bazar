class MarketPlacesController < ApplicationController
  def index
    @stores = Store.all.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def show
    @products = Store.find(params[:id]).products.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def product
    @product = Product.find(params[:id])
  end
end
