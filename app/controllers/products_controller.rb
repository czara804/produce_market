class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_product, only: [:edit, :update, :destroy]
  before_action :authorise_user!, only: [:update, :edit, :destroy]
  
  
  def index
    @products = Product.all
  end

  def show
  #  @product = Product.find(params[:id])
  find_product
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.create(product_params)
    # @product.user_id = current_user.id

    if (@product.save)
      redirect_to @product
    else 
      render :new
    end 
  end

  def edit
  end

  def update 
    if @product.update(product_params)
      
      redirect_to @product
    else 
      render :edit
    end 

  end 

  def destroy
    @product.delete

    redirect_to products_path
  end 

private 

def product_params
  params.require(:product).permit(:name, :description, :quantity, :price, :delivery_option, :photo)
end

def find_product
@product = Product.find(params[:id])
end 

def authorise_user!
  return true if current_user.id == @product.user_id
  
end


end
