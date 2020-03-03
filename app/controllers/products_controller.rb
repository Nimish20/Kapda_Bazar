class ProductsController < ApplicationController
  before_action :load_product, except: [:new, :index, :create, :show]

  def index
    @products = current_seller.store.products.paginate(page: params[:page],per_page: PER_PAGE)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = current_seller.store.products.new(product_params)
    if @product.save
      flash[:primary] = "Product added succesfully"
      redirect_to seller_products_path
    else
      flash[:alert] = @product.errors.full_messages.join("<br></li><li>").html_safe
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    if @product.update(product_params)
      flash[:primary] = "Product updated succesfully."
      redirect_to seller_products_path
    else
      flash[:alert] = @product.errors.full_messages.join("<br></li><li>").html_safe
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to seller_products_path
  end

  private
  
  def product_params
    params.require(:product).permit(:name, :size, :price, :rent_cost, :color, :category_id, image: [])
  end

  def load_product
    @product = current_seller.store.products.find(params[:id])
  end
end
