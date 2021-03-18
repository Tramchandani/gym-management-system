class User < ApplicationRecord
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  has_many_attached :images
  validates :first_name, :email, presence: true
  validates :password, presence: true, length: { in: 3..20 }, confirmation: true, if: :updating_profile?
  validates :email, uniqueness: { case_sensitive: false }, format: { with: REGEX }

  def updating_profile?
    new_record? || password.present?
  end
end
