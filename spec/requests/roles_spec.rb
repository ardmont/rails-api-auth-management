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
end
