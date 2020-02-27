class Product < ApplicationRecord
  has_many_attached :photos
  validates :delivery_option, inclusion: { in: %w[pick-up delivery either] }
  belongs_to :user
end
