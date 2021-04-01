class Exercise < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items
  validates :name, :price, presence: true
  validates :price, numericality: true
end
