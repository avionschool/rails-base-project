module QuoteRandomizer
  class Client
      def self.today
          response = Request.call(http_method: 'get', endpoint:'/today.json')
      end

      def self.random(lang="en")
          response = Request.call(http_method: 'get', endpoint:'/random.json')
      end
  end
end