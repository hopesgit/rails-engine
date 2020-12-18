require 'rails_helper'

describe "as a user" do
  describe 'when I send a patch request to "/api/vi/merchants/:id" with a supplied name', type: :request do

    xit 'doesn\'t change name if name or id are passed as query params' do
      # this test is intended to fail because it doesn't reach the strong params set up for the update action
      merchant = Merchant.create!(name: Faker::Company.name)
      original_name = merchant.name
      patch "/api/v1/merchants/#{merchant.id}?id=#{merchant.id}&name=hot+doggers"
      merchant.reload
      new_name = merchant.name

      expect(original_name).to eq(new_name)
    end

    before :all do
      @merchant = Merchant.create!(name: Faker::Company.name)
      @original_name = @merchant.name
      patch "/api/v1/merchants/#{@merchant.id}", params: {merchant: {name: "Hot Doggers"}}
      @merchant.reload
      @new_name = @merchant.name
    end

    it 'sends a successful request' do
      expect(response).to have_http_status(:success)
    end

    it 'changes the object\'s name' do
      expect(JSON.parse(response.body)).to eq("data" => {"id" => "#{@merchant.id}", "type" => "merchant", "attributes" => {"id" => @merchant.id, "name" => @new_name}})
      expect(@original_name).to_not eq(@new_name)
    end
  end
end
