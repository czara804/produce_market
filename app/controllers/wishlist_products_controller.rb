class WishlistProductsController < ApplicationController

  def index
    @wishlist_products = WishlistProduct.available.for_user(current_user)
  end 

  def add
    product = Product.find(params[:id])
    if current_user.wishlist_products.map(&:product).include?(product)
      redirect_to profile_show_path, notice: "#{product.name} is already in your wishlist"
    else      
      WishlistProduct.create!(product: product, user: current_user)
      # redirect somewhere?
    end
  end

 def destroy
  wishlist_product = WishlistProduct.find(params[:id])
  wishlist_product.destroy

  redirect_to profile_show_path
 end 


end
