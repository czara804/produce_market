class CartItemsController < ApplicationController

  def index
    @cart = current_user.cart
    @cart_items = current_user.cart.cart_items.available

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
          name: 'agora_cart_total',
          description: @cart_items.map {|ci| ci.product.name }.join(' , '),
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
