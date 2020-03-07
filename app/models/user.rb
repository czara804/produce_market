class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_one_attached :profile
  has_many :wishlist_products
  has_one :cart

  after_create :create_cart
  
  def create_cart
    cart = Cart.create(user: self)
  end 
end
