class Product < ApplicationRecord
  has_one_attached :photo
  validates :delivery_option, inclusion: { in: %w[pick-up delivery either] }
  belongs_to :user
  has_many :wishlist_products, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  def self.search(search)
    if search
      where(["name LIKE ?","%#{search}%"])
    else
      all
    end
  end 
end
