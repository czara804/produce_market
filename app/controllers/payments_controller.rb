class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success
    current_user.cart.cart_items.each do |item|
      Order.create(user_id: current_user.id, product_id: item.product_id, status: 'pending')
      item.product.update(available: false)
      CartItem.delete(item.id)
    end 
    # current_user.cart.cart_items
  end

  def webhook
      p params
  end
end
