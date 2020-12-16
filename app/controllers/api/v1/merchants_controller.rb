class Api::V1::MerchantsController < ApplicationController
  def index
    limit = 20
    limit = params[:limit] if !params[:limit].nil? && params[:limit].to_i.class == Integer
    render json: MerchantSerializer.new(MerchantFacade.merchants(limit))
  end

  def show
    id = params[:id] if params[:id].to_i.class == Integer
    render json: MerchantSerializer.new(MerchantFacade.merchant(id))
  end
end
