class Api::V1::MerchantFindersController < ApplicationController
  def show
    # binding.pry
    render json: MerchantSerializer.new(MerchantFacade.find_merchant(params[:name].downcase))
  end
end
