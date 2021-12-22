  class UpdateStockPricesJob

    def UpdateStockPricesJob.perform
      BackgroundServices::UpdateStockPrices.new.update
    end

  end

