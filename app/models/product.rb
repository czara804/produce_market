class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :delivery_option, inclusion: { in: %w[pick-up delivery either] }
  has_one_attached :photo
  belongs_to :user
  has_many :wishlist_products, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_one :order

  


  def self.search(search)
    if search
      where(["name ILIKE ?","%#{search}%"])
    else
      all
    end
  end 
end
