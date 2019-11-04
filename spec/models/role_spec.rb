require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should have_many(:users) }
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:level) }
end
