module QuoteRandomizer
    class Client
        def self.today
            response = Request.get(endpoint:'/today.json')
        end
    end
end