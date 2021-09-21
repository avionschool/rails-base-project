class UpdateMarketDataJob

  def self.perform
    JobsServices::UpdateStockData.new.call
  end
end
