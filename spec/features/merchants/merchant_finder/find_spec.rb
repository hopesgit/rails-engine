require 'rails_helper'

describe "as a user" do
  describe "when I visit /api/v1/merchants/find with a name query parameter", type: :request do
    before :all do
      @merchant_1 = Merchant.create!(name: "Waterfall Treasures")
      @merchant_2 = Merchant.create!(name: "Turing Basement")
      @merchant_3 = Merchant.create!(name: "Wigs and Locks")
      @merchant_4 = Merchant.create!(name: "Ring of Power")
      @merchant_5 = Merchant.create!(name: "Wandering Traveler")
      get '/api/v1/merchants/find?name=ring'
    end

    it "it sends a successful request" do
      expect(response).to have_http_status(:success)
    end

    it "finds the first result that includes the term in it, partially if necessary" do
      answer = JSON.parse(response.body)["data"]["attributes"]["name"]
      expect(answer).to eq(@merchant_2.name)
    end
  end
end
