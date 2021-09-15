class HomeController < ApplicationController
  def index
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_120e7d5173ef4d039e69274c8a21bde4',
      secret_token: 'Tsk_adbfa3c9eedc4ce8aae006027027ea78',
      endpoint: 'https://sandbox.iexapis.com/stable'
    )

    @all = client.crypto('SQL')
    @fb = client.price('FB')
    @chart = client.chart('MSFT', 'id', chart_simplify: true)
    @logo = client.logo('MSFT')

    @logo.url # 'https://storage.googleapis.com/iex/api/logos/MSFT.png'
  end
end
