class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, length: { maximum: 100 }
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than: 1_000_000 }
end
