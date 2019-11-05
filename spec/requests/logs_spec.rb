require 'rails_helper'

RSpec.describe "Logs requests", type: :request do
  let!(:logs) { create_list(:log, 45) }
  let(:log_sample) { logs.sample }
  let(:log_sample_id) { log_sample.id }

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

  describe 'GET /logs/:id' do
    before { get "/logs/#{log_sample_id}" }

    context 'When log exists' do
      it 'Returns log' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(log_sample_id)
      end

      it 'Returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'When log doesn\'t exists' do
      let(:log_sample_id) { 100 }
  
      it 'Returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

end