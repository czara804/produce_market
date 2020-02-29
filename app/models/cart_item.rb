class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  scope :available, -> {joins(:product).where("products.available" => true)}
  
end
