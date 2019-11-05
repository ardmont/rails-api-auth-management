class Role < ApplicationRecord
  has_many :users

  validates :name, uniqueness: true
  validates :name, :level, presence: true
end
