require 'rails_helper'

RSpec.describe "Logs", type: :request do
  describe "GET /logs" do
    it "Should return http status 200" do
      get logs_path
      expect(response).to have_http_status(200)
    end
  end
end
