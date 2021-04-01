class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :addresses, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_one :cart, dependent: :destroy
  validates :first_name, :email, presence: true
  validates :password, presence: true, length: { in: 3..20 }, confirmation: true, if: :should_validate_password?
  validates :email, uniqueness: { case_sensitive: false }, format: { with: REGEX }
  after_create :create_user_cart
  after_create :send_mail

  def in_cart?(exercise)
    cart = self.cart 
    cart.exercises.exists?(exercise.id)
  end
  
  private

  def should_validate_password?
    new_record? || password.present?
  end

  def create_user_cart
    self.create_cart
  end

  def send_mail
    EmailJob.perform_later self
  end
end
