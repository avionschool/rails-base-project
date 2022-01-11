require 'rest-client'

module StockDataFinder
  class Request
      BASE_URL = 'https://api.stockdata.org/'
      TOKEN = 'Wkp3TxiqLmsMdu9DrqmCc1IAwaSVi86dfHkgMD9A'

      def self.call(http_method:, endpoint:)
          result = RestClient::Request.execute(
              method: http_method,
            #   url: "#{BASE_URL}#{endpoint}",
              url: "#{BASE_URL}#{endpoint}&api_token=#{TOKEN}",
              # headers: {'Content-Type'=> 'application/json'}
          )
          
          {code: result.code, status: 'Success', data:JSON.parse(result)}
      rescue RestClient::ExceptionWithResponse => error
          {code: error.http_code, status: error.message, data:Errors.map(error.http_code)}
      end
  end
  
end