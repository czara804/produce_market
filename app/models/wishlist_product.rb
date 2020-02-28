class WishlistProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :available, -> {joins(:products).where("products.available" => true)}
end
