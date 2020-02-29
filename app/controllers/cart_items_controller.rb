class CartItemsController < ApplicationController

  def index
    @cart = current_user.cart
    @cart_items = current_user.cart.cart_items.available
  end 

  def show
  end 

  def add
    product = Product.find(params[:id])
    CartItem.create!(product: product, cart: current_user.cart)
    redirect_to cart_items_path
  end 


  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy

    redirect_to cart_items_path
  end 

end
