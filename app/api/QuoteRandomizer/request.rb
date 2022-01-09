require 'httparty'

module QuoteRandomizer
    class Request
        BASE_URL = 'https://uselessfacts.jsph.pl/'
        TOKEN = 'token'

        def self.get(endpoint:)
            result = HTTParty.get("#{BASE_URL}#{endpoint}")
        rescue HTTParty::Error
        rescue StandardError
            case result.code
              when 200
                {code: result.code, status: 'Success', data: result.parsed_response}
              when 401
                {code: result.code, status: 'Unauthorized request'}
              when 404
                {code: result.code, status: 'Not found'}
              when 500...600
                {code: result.code, status: 'Error'}
            end
        end
    end
    
end