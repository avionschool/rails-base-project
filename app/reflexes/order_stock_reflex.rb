# frozen_string_literal: true

class OrderStockReflex < ApplicationReflex
  def action
    params[:transactiontype] = element.value
  end
end
