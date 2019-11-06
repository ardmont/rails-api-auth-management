class User < ApplicationRecord
  belongs_to :role
  has_secure_password

  validates :email, uniqueness: true
  validates :name, :email, :password_digest, presence: true
end
