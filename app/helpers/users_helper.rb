module UsersHelper
  def user_balance
    bal = 300_000
    number_to_currency(bal, unit: 'PHP ')
  end
end
