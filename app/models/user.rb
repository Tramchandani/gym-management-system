class User < ApplicationRecord

  regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  validates :first_name, :email, :password, presence: true
  validates :password, length: { in: 3..20 }
  validates :password, confirmation: true
  validates :email, uniqueness: { case_sensitive: false}, format: { with: regex}
end