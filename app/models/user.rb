class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, email: true, confirmation: true
  validates :password, presence: true
  has_secure_password
end