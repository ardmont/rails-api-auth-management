require 'rails_helper'

RSpec.describe "Roles requests", type: :request do
  let!(:role_sample) { create(:role) }
  let(:role_sample_id) { role_sample.id }

  describe "GET /roles" do
    it "Should return http status 200" do
      get roles_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /roles/:id' do
    before { get "/roles/#{role_sample_id}" }

    context 'When role exists' do
      it 'Returns role' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(role_sample_id)
      end

      it 'Returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'When role doesn\'t exists' do
      let(:role_sample_id) { 100 }

      it 'Returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /roles' do
    let(:valid_payload) { { name: 'Test role', level: 3} }

    context 'When payload is valid' do
      before { post '/roles', as: :json, params: valid_payload }

      it 'Create role' do
        expect(json['name']).to eq('Test role')
      end

      it 'Return status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'When payload isn\'t valid' do
      before { post '/roles', as: :json, params: { level: 3 } }

      it 'Return status code 422' do
        expect(response).to have_http_status(422)
      end
    end

    context 'When the role name has already been taken' do
      before { post '/roles', as: :json, params: { name: role_sample.name, level:2 } }

      it 'Return status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /roles/:id' do
    let(:valid_payload) { { name: 'New name' } }

    context 'When role exists' do
      before { put "/roles/#{role_sample_id}",  as: :json, params: valid_payload }

      it 'Update role' do
        expect(json['name']).to eq('New name')
      end

      it 'Return status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /roles/:id' do
    before { delete "/roles/#{role_sample_id}" }

    it 'Return status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
