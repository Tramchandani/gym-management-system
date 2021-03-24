class Cart < ApplicationRecord
  belongs_to :user
  has_many :exercise_in_carts
  has_many :exercises, through: :exercise_in_carts
end
