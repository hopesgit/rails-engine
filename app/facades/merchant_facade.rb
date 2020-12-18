class MerchantFacade
  def self.merchants(limit)
    Merchant.first(limit)
  end

  def self.merchant(id)
    merchant = Merchant.find_by(id: id)
    return merchant
  end

  def self.new_merchant(name)
    Merchant.create(name: name)
  end

  def self.update_merchant(params)
    merchant = Merchant.find(params[:id])
    merchant.update(name: params[:name])
    merchant.reload
    return merchant
  end

  def self.destroy_merchant(params)
    merchant = Merchant.find_by(id: params[:id])
    if !merchant.nil?
      merchant.destroy
    else
      return false
    end
  end
end
