require 'rails_helper'

describe "As a user" do
  describe "when I send a get request to /api/v1/merchants/:id", type: :request do

    before :all do
      3.times { Merchant.create!(name: Faker::Company.name) }
      @merchant = Merchant.last
    end

    it "makes a successful request" do
      get "/api/v1/merchants/#{@merchant.id}"

      expect(response).to have_http_status(:success)
    end

    it "shows me the data for that specific merchant if record exists" do
      get "/api/v1/merchants/#{@merchant.id}"
      parsed_response = JSON.parse(response.body)

      expect(parsed_response["data"]).to eq("id" => "#{@merchant.id}", "type" => "merchant", "attributes" => {"id" => @merchant.id, "name" => @merchant.name})
      expect(parsed_response.count).to eq(1)
    end

    # edge testing
    it "doesn't show data for a merchant that doesn't exist" do
      get "/api/v1/merchants/5"
      expect(JSON.parse(response.body)["data"]).to eq(nil)
    end
  end
end
