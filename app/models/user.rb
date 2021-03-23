class User < ApplicationRecord
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  has_many_attached :images
  validates :first_name, :email, presence: true
  validates :password, presence: true, length: { in: 3..20 }, confirmation: true, if: :should_validate_password?
  validates :email, uniqueness: { case_sensitive: false }, format: { with: REGEX }

  private
  
  def should_validate_password?
    new_record? || password.present?
  end
end
