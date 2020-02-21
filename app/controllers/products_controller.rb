class ProductsController < ApplicationController
  
  
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.
  end

  def new
  end

  def create
    
  end

  def edit
  end

  def update 

  end 

  def destroy

  end 

private 

def product_params
  params.require(:product).permit(:name, :description, :quantity, :price, :delivery_option)
end



end
