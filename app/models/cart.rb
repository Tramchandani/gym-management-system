class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :exercises, through: :cart_items
end
