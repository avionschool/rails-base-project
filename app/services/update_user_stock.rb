class UpdateUserStock
  def self.call(...)
    new(...).execute
  end

  def initialize(user, user_stock, trade)
    @user = user
    @user_stock = user_stock
    @trade = trade
  end

  def execute
    case @trade.transaction_type
    when 'buy'
      @user_stock.update(quantity: @user_stock.quantity + @trade.quantity)
    when 'sell'
      @user_stock.update(quantity: @user_stock.quantity - @trade.quantity)
      @user_stock.delete if @user_stock.quantity.zero?
    end

    return OpenStruct.new(success?: false, user_stock: nil, errors: @user_stock.errors) unless @user_stock.save

    OpenStruct.new(success?: true, user_stock: @user_stock, errors: nil)
  end
end
