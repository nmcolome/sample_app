class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, email: true, confirmation: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end