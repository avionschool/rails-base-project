class UpdateMarketDataJob
  # queue_as :default

  def self.perform()
    puts "Job test for update market data"
    JobsServices::UpdateStockData.new.call
  end
end
