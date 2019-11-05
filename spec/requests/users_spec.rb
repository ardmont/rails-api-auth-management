require 'rails_helper'

RSpec.describe "Users requests", type: :request do
  let!(:role) { create(:role)}
  let!(:users) { create_list(:user, 45, role_id: role.id) }
  let(:user_sample) { users.sample }
  let(:user_sample_id) { user_sample.id }

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
    end

    context 'GET /users?name_eq=[name]' do 
      before { get "/users?name_eq=#{user_sample.name}" }
      
      it 'Should return users by name' do
        expect(json).not_to be_empty
        expect(json[0]['name']).to eq(user_sample.name)
      end
    end

    context 'GET /users?role_id_eq=[role_id]' do 
      before { get "/users?role_id_eq=#{user_sample.role.id}" }
      
      it 'Should return users by role' do
        expect(json).not_to be_empty
        expect(json[0]['role']['name']).to eq(user_sample.role.name)
      end

    end

  end

  describe 'GET /users/:id' do
    before { get "/users/#{user_sample_id}" }

    context 'When user exists' do
      it 'Returns user' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user_sample_id)
      end

      it 'Returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'When user doesn\'t exists' do
      let(:user_sample_id) { 100 }

      it 'Returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
