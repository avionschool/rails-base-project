# require 'rest-client'

# module News
#     class Request
#         BASE_URL = 'https://api.marketaux.com/v1'
#         TOKEN = 'Rvzw0WhdZ9EXjG6AhEFjGV5oqpdR2AtQbALy4sNN'

#         def self.call(http_method:, endpoint:)
#             result = RestClient::Request.execute(
#                 method: http_method,
#                 url: "#{BASE_URL}#{endpoint}&api_token=#{TOKEN}",
#                 headers: {'Content-Type'=> 'application/json'}
#             )
#             JSON.parse(result)
#             {code: result.code, status: 'Success', data:JSON.parse(result)}
#             rescue RestClient::ExceptionWithResponse => error
#             {code: error.http_code, status: error.message, data:Errors.map(error.http_code)}
#         end
#     end
# end