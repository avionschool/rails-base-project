module News
    class Client
        def self.global
            response = Request.call(http_method: 'get', endpoint:'/news/all?countries=global&filter_entities=true&limit=10&published_after=2022-01-10T15:46')
        end

        def self.exchange
            response = Request.call(http_method: 'get', endpoint:'/news/all?exchanges=NYSE&filter_entities=true&limit=10&published_after=2022-01-10T15:37')
        end
    end
end