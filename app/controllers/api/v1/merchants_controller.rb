class Api::V1::MerchantsController < ApplicationController
  def index
    limit = 20
    limit = params[:limit] if !params[:limit].nil?
    render json: MerchantSerializer.new(MerchantFacade.merchants(limit))
  end
end
