class HomeController < ApplicationController

  def index
    client = IEX::Api::Client.new(
    publishable_token: 'Tpk_120e7d5173ef4d039e69274c8a21bde4',
    secret_token: 'Tsk_adbfa3c9eedc4ce8aae006027027ea78',
    endpoint: 'https://sandbox.iexapis.com/stable'
    )  

    @all = client.crypto('SQL')
    @fb = client.price('FB')
  end

  
end
