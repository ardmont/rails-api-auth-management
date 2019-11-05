require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:role) { create(:role)}
  let!(:users) { create_list(:user, 45, role_id: role.id) }

  describe "GET /users" do
    it "Should return http status 200" do
      get users_path
      expect(response).to have_http_status(200)
    end
        
    context 'GET /users?page=2&per_page=30' do
      before { get '/users?page=2&per_page=30' }
  
      it 'Should return users list using pagination' do
        expect(json).not_to be_empty
        expect(json.size).to eq(15)
      end
  
      it 'Should return http status 200' do
        expect(response).to have_http_status(200)
      end
    end

  end
end
