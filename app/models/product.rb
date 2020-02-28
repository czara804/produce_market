class Product < ApplicationRecord
  has_one_attached :photo
  validates :delivery_option, inclusion: { in: %w[pick-up delivery either] }
  belongs_to :user
  has_many :wishlist_products, dependent: :destroy
end
