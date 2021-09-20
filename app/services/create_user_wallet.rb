class CreateUserWallet
  def self.call(...)
    new(...).execute
  end

  def initialize(user)
    @user = user
  end

  def execute
    @wallet = Wallet.create(user_id: @user.id, running_balance: 1_000_000)
    return OpenStruct.new(success?: false, wallet: nil, errors: @wallet.errors) unless @wallet.save

    OpenStruct.new(success?: true, wallet: @wallet, errors: nil)
  end
end
