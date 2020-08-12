class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, length: { in: 4..20 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end