module Freenews
  class Client
      def self.business
          response = Request.call(http_method: 'get', endpoint:'/top-headlines/category/business/us.json')
      end

      def self.health
          response = Request.call(http_method: 'get', endpoint:'/top-headlines/category/health/us.json')
      end
  end
end