class User < ApplicationRecord
	regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  validates :first_name, :email, :password, presence: true
  validates :password, length: { in: 3..20 }
  validates :password, confirmation: true
  validates :email, uniqueness: { case_sensitive: false}, format: { with: regex}

  regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates_with Regex
end

class Regex < ActiveModel::Validator
	def validate(record)
		unless record.email =~ "/^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$/"
			record.errors.add :base, "Invalid email"
		end
	end
end
 #  /^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$/