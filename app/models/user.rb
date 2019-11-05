class User < ApplicationRecord
  belongs_to :role

  validates :email, uniqueness: true
  validates :name, :email, :password, presence: true
end
