require 'rails_helper'

describe "As a user" do
  describe "when I send a get request to /api/v1/merchants/:id", type: :request do
    before :all do
      3.times { Merchant.create!(name: Faker::Company.name) }
      @merchant = Merchant.last
      get "/api/v1/merchants/#{@merchant.id}"
    end

    it "makes a successful request" do
      expect(response).to have_http_status(:success)
    end

    it "shows me the data for that specific merchant if record exists" do
      expect(JSON.parse(response.body)["data"]).to eq("id" => "#{@merchant.id}", "type" => "merchant", "attributes" => {"id" => @merchant.id, "name" => @merchant.name})
    end
  end
end
