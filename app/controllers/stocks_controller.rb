class StocksController < ApplicationController
  def index
    @stocks = Stock.all.paginate(page: params[:page], per_page: 50)
  end

  def search
    @stock = Stock.new_lookup(params[:ticker])
    render 'show'
  end

  def show; end

  def update_stock
    Stock.delete_all
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publish_access_key],
      secret_token: Rails.application.credentials.iex_client[:secret_access_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    symbols = client.ref_data_symbols
    nas_symbols = symbols.select { |symbol| symbol.exchange == 'NAS' }
    @selected_symbols = (0...nas_symbols.length).select { |x| x % 30 == 30 - 1 }.map { |y| nas_symbols[y] }

    @selected_symbols.each do |stock|
      Stock.find_or_create_by('ticker' => stock.symbol, 'company' => client.company(stock.symbol).company_name, 'change_percent' => client.quote(stock.symbol).change_percent_s, 'price' => client.price(stock.symbol))
    rescue StandardError
      # exception
    end
    redirect_to stocks_path
  end
end
