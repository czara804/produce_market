class CartItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :add, :destroy]

  def index
    @cart = current_user.cart
    @cart_items = current_user.cart.cart_items.available
    unless current_user.cart.cart_items.empty?
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: 'agora_cart_total',
            description:  @cart_items.map{|ci| ci.product.name }.join(' , '),
            amount: @cart.total_price * 100,
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id
            }
        },
        success_url: "#{root_url}/payments/success",
        cancel_url: "#{root_url}products"
    )

      @session_id = session.id
    end
  end 

  def show

  
  end 

  def add
    product = Product.find(params[:id])
    if current_user.cart.cart_items.detect { |ci| ci.product_id == product.id }
      redirect_to product_path(product), notice: "#{product.name} already in cart"
    else
      CartItem.create!(product: product, cart: current_user.cart)
      redirect_to cart_items_path
    end
  end 


  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy

    redirect_to cart_items_path
  end 

end
