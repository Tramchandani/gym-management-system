class Exercise < ApplicationRecord
  has_many :exercise_in_carts
  has_many :carts, through: :exercise_in_carts
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  validates :name, :price, presence: true
  validates :price, numericality: true
end
