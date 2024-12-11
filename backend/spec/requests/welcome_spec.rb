require 'rails_helper'

RSpec.describe "WelcomeController", type: :request do
  describe "GET /" do
    it "returns a successful response with the correct JSON" do
      get root_path headers: { "X-CSRF-Token" => "test" }
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(JSON.parse(response.body)).to eq({ "message" => "Welcome to the Mover Management System!" })
    end
  end
end
