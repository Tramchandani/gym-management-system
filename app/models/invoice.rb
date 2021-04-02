class Invoice < ApplicationRecord
  has_many :invoice_items
  has_many :exercises, through: :invoice_items
  belongs_to :user
end
