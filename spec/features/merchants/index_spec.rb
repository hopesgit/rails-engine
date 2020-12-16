require 'rails_helper'

describe 'as a user' do
  describe 'when I send a get request to "/api/v1/merchants"', type: :request do

    before :all do
      20.times do
        Merchant.create!(
          name: Faker::Company.name
        )
      end
      get '/api/v1/merchants'
      @merchant_1 = Merchant.first
    end

    it 'it has a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'I get a list of Merchants' do
      parsed_response = JSON.parse(response.body)["data"]
      expect(parsed_response[0]).to eq({"id" => "1", "type" => "merchant", "attributes" => {"id" => @merchant_1.id, "name" => @merchant_1.name}})
      expect(parsed_response.count).to eq(20)
    end
  end
end
