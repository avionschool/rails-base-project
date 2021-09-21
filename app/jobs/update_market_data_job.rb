class UpdateMarketDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Job test for update market data"
  end
end
