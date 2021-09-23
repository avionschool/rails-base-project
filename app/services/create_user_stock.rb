class CreateUserStock
  def self.call(...)
    new(...).execute
  end

  def initialize(user, stock, trade)
    @user = user
    @stock = stock
    @trade = trade
  end

  def execute
    @user_stock = @user.user_stocks.create(stock_code: @stock.code, quantity: @trade.quantity)
    return OpenStruct.new(success?: false, user_stock: nil, errors: @user_stock.errors) unless @user_stock.save

    OpenStruct.new(success?: true, user_stock: @user_stock, errors: nil)
  end
end
