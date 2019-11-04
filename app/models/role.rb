class Role < ApplicationRecord
  has_many :users
  validates :type, :level, presence: true
end
