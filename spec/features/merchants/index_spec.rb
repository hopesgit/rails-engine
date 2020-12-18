require 'rails_helper'

describe 'as a user' do
  describe 'when I send a get request to "/api/v1/merchants"', type: :request do

    before :all do
      100.times do
        Merchant.create!(
          name: Faker::Company.name
        )
      end
    end

    it 'it has a successful response' do
      get '/api/v1/merchants'
      expect(response).to have_http_status(:success)
    end

    it 'it returns a list of 100 Merchants' do
      get '/api/v1/merchants'
      merchant_1 = Merchant.first
      parsed_response = JSON.parse(response.body)["data"]
      expect(parsed_response[0]).to eq({"id" => "#{merchant_1.id}", "type" => "merchant", "attributes" => {"id" => merchant_1.id, "name" => merchant_1.name}})
      expect(parsed_response.count).to eq(100)
    end

    it 'returns a different number of Merchants if given a limit param' do
      get '/api/v1/merchants', params: {limit: 50}
      merchant_2 = Merchant.all[49]
      parsed_response = JSON.parse(response.body)["data"]
      expect(parsed_response[49]).to eq({"id" => "#{merchant_2.id}", "type" => "merchant", "attributes" => {"id" => merchant_2.id, "name" => merchant_2.name}})
      expect(parsed_response.count).to eq(50)
    end

    # write test for very high limits
    # write test for limit 0
    # write test for negative limits (can this even be passed?)
    # write test for limit param exceeding # of entries
  end
end
