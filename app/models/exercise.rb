class Exercise < ApplicationRecord
  validates :name, :price, presence: true
  validates :price, numericality: true
end
