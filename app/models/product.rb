class Product < ApplicationRecord
  has_one_attached :photo
  validates :delivery_option, inclusion: { in: %w[pick-up delivery either] }
end
