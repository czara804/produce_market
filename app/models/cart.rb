class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items 


  def total_price
    cart_items.inject(0) do |sum, item|
      sum += item.product.price 
    end 
    
  end 
  
  
end




