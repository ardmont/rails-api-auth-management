class Log < ApplicationRecord
  validates :action, :message, presence: true
end
