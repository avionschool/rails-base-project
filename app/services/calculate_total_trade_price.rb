class CalculateTotalTradePrice
  def self.call(...)
    new(...).execute
  end

  def initialize(stock, quantity)
    @stock = stock
    @quantity = quantity
  end

  def execute
    @total_price = @stock.current_price * @quantity
  end
end
