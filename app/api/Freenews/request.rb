require 'rest-client'

module Freenews
    class Request
        BASE_URL = 'https://saurav.tech/NewsAPI/'
        TOKEN = 'token'

        def self.call(http_method:, endpoint:)
            result = RestClient::Request.execute(
                method: http_method,
                url: "#{BASE_URL}#{endpoint}",
                # url: "#{BASE_URL}#{endpoint}?apikey=#{TOKEN}"
                headers: {'Content-Type'=> 'application/json'}
            )
            
            {code: result.code, status: 'Success', data:JSON.parse(result)}
        rescue RestClient::ExceptionWithResponse => error
            {code: error.http_code, status: error.message, data:Errors.map(error.http_code)}
        end
    end
    
end