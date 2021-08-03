class Stock < ApplicationRecord
    require 'iex-ruby-client'
    import 'requests'
    

    include IEX
    'https://cloud.iexapis.com/v1'

    
end
