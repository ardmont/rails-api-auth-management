require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:role) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }

  subject { create(:user) }
  it { should validate_uniqueness_of(:email) }
  it { should have_db_index(:email).unique(true) }
end
