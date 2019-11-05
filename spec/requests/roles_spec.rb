require 'rails_helper'

RSpec.describe "Roles", type: :request do
  describe "GET /roles" do
    it "Should return http status 200" do
      get roles_path
      expect(response).to have_http_status(200)
    end
  end
end
