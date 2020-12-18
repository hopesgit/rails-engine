require 'rails_helper'

describe 'as a user', type: :request do
  describe 'when I send a delete request to /api/v1/merchants/:id' do
    before :each do
      merchant = Merchant.create(name: Faker::Company.name)
      @merchant_id = merchant.id
      delete "/api/v1/merchants/#{merchant.id}"
    end
    it 'sends a successful request' do
      expect(response).to have_http_status(:success)
    end

    it 'deletes the indicated merchant' do
      expect(Merchant.find_by(id: @merchant_id)).to eq(nil)
      expect(response).to have_http_status(:no_content)
    end

    # more edge testing
    it 'can\'t delete a record that has already been deleted' do
      delete "/api/v1/merchants/#{@merchant_id}"
      expect(JSON.parse(response.body)["data"]).to eq(nil)
    end
  end
end
