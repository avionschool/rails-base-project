module ApplicationHelper
  def calculate_balance(debit, credit)
    total__balance = debit - credit
    number_to_currency(total__balance, unit: ' PHP ')
  end
end
