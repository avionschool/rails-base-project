module Coingecko
    class Client
        include HTTParty

        base_uri 'https://api.coingecko.com/api/v3'

        def self.price(ids)

            if ids.is_a? Array
                ids = ids.join(',')
            end
            options = { query: {
                ids: ids, 
                vs_currencies: 'usd',
                include_24hr_change: 'true',
                include_24hr_vol: 'true'
                }
            }
            # byebug
            res = HTTParty.get("#{base_uri}/simple/price", options)
            self.process_res(res)
        end

        def self.list
            res = HTTParty.get("#{base_uri}/coins/list")
            self.process_res(res)
        end

        private

        def self.process_res(res)
            case res.code
              when 200
                {code: res.code, status: 'success', data: res.parsed_response}
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