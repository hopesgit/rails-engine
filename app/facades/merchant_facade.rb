class MerchantFacade
  def self.merchants(limit)
    Merchant.all[0..(limit.to_i - 1)]
  end

  def self.merchant(id)
    Merchant.find(id)
  end
end
