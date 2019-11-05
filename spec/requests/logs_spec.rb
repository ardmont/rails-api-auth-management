require 'rails_helper'

RSpec.describe "Logs", type: :request do
  let!(:logs) { create_list(:log, 45) }

  describe "GET /logs" do
    it "Should return http status 200" do
      get logs_path
      expect(response).to have_http_status(200)
    end
    
    context 'GET /logs?page=2&per_page=30' do
      before { get '/logs?page=2&per_page=30' }
  
      it 'Should return logs list using pagination' do
        expect(json).not_to be_empty
        expect(json.size).to eq(15)
      end
  
      it 'Should return http status 200' do
        expect(response).to have_http_status(200)
      end
    end

  end
end
