class StocksController < ApplicationController
  # before_action :fetch_api, only: [:search, :index]

  def index
     @stocks = Stock.all.paginate(page: params[:page], per_page: 50)
  end

  def search
    @stock = Stock.new_lookup(params[:stock])
    render 'index'
  end

  # def add_buyer_stock
  #   redirect_to root_path
  # end

  def update_stock
    Stock.delete_all
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publish_access_key],
      secret_token: Rails.application.credentials.iex_client[:secret_access_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    symbols = client.ref_data_symbols()
    nas_symbols = symbols.select{|symbol| symbol.exchange == 'NAS' }
    @selected_symbols = (0... nas_symbols.length).select{ |x| x%30 == 30-1 }.map { |y| nas_symbols[y] } 

    @selected_symbols.each do|stock| 
      begin
        Stock.find_or_create_by('ticker'=>stock.symbol, 'company' => client.company(stock.symbol).company_name,'change_percent'=>client.quote(stock.symbol).change_percent_s, 'price'=>client.price(stock.symbol))
      rescue => exception 
      end
    end
    redirect_to stocks_path
  end
  
  # private
  
  # def fetch_api
  #   @client = IEX::Api::Client.new(
  #     publishable_token: Rails.application.credentials.iex_client[:publish_access_key],
  #     secret_token: Rails.application.credentials.iex_client[:secret_access_key],
  #     endpoint: 'https://sandbox.iexapis.com/v1'
  #   )
  # end
end
