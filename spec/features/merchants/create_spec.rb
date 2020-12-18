require 'rails_helper'

describe "as a user" do
  describe "when I send a post request to 'api/v1/merchants'", type: :request do

    before :all do
      @merchant_name = Faker::Company.name
      post '/api/v1/merchants/', params: {name: @merchant_name}
    end

    it "sends a successful response" do
      expect(response).to have_http_status(:success)
    end

    it "creates a merchant with the supplied params" do
      expect(Merchant.last.name).to eq(@merchant_name)
    end

    it "doesn't create new merchant if name params empty" do
      post '/api/v1/merchants'

      expect(JSON.parse(response.body)["data"]["id"]).to eq(nil)
    end
  end
end
