class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  scope :available, -> {joins(:products).where("products.available" => true)}
end
