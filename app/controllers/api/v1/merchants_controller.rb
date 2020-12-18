class Api::V1::MerchantsController < ApplicationController
  def index
    limit = 100
    limit = params[:limit].to_i if !params[:limit].nil? && params[:limit].to_i.class == Integer
    render json: MerchantSerializer.new(MerchantFacade.merchants(limit))
  end

  def show
    id = params[:id] if params[:id].to_i.class == Integer
    render json: MerchantSerializer.new(MerchantFacade.merchant(id))
  end

  def create
    render json: MerchantSerializer.new(MerchantFacade.new_merchant(params[:name]))
  end

  def update
    render json: MerchantSerializer.new(MerchantFacade.update_merchant(update_params))
  end

  def destroy
    destruction = MerchantFacade.destroy_merchant(destroy_params)
    head :no_content if destruction
    render json: MerchantSerializer.new(destruction) if !destruction
  end

  private
  def update_params
    update = {}
    update[:name] = params.require(:merchant).permit(:name)[:name]
    update[:id] = params.permit(:id)[:id]
    return update
  end

  def destroy_params
    params.permit(:id)
  end
end
