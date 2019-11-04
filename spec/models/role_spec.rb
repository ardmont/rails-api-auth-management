require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should have_many(:users) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:level) }

  subject { create(:role) }
  it { should validate_uniqueness_of(:name) }
  it { should have_db_index(:name).unique(true) }
end
