class Role < ApplicationRecord
  has_many :users
  validates :name, :level, presence: true
end
