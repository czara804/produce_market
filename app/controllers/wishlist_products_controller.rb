class WishlistProductsController < ApplicationController

  def index
    @wishlist_products = WishlistProduct.available.for_user(current_user)
  end 

  def add
    product = Product.find(params[:id])
    if current_user.wishlist_products.exclude?(product.id)
      WishlistProduct.create!(product: product, user: current_user)
    else
      redirect_to show_profile_path, notice: "#{product.name} is already in your wishlist"
    end 
  end

 def destroy
  wishlist_product = WishlistProduct.find(params[:id])
  wishlist_product.destroy

  redirect_to profile_show_path
 end 


end
