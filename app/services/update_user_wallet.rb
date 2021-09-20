class UpdateUserWallet
  def self.call(...)
    new(...).execute
  end

  def initialize(user, trade)
    @user = user
    @trade = trade
    @wallet = @user.wallet
  end

  def execute
    transaction_amount = @trade.quantity * @trade.price

    case @trade.transaction_type
    when 'buy'
      @wallet.update(running_balance: @wallet.running_balance - transaction_amount)
    when 'sell'
      @wallet.update(running_balance: @wallet.running_balance + transaction_amount)
    end

    return OpenStruct.new(success?: false, wallet: nil, errors: @wallet.errors) unless @wallet.save

    OpenStruct.new(success?: true, wallet: @wallet, errors: nil)
  end
end
