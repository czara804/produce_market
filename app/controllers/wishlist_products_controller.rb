class WishlistProductsController < ApplicationController

  def index
    @wishlist_products = WishlistProduct.available.for_user(current_user)
  end 

  def add
    product = Product.find(params[:id])
    WishlistProduct.create!(product: product, user: current_user)
    redirect_to products_path
  end

 def destroy
  wishlist_product = WishlistProduct.find(params[:id])
  @wishlist_product.destroy

 end 


end
