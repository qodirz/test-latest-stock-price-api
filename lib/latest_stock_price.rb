require 'net/http'
require 'json'
require 'uri'

module LatestStockPrice
  class Client
    API_BASE_URL = 'https://latest-stock-price.p.rapidapi.com'
    DEFAULT_API_KEY = '1d8ed436a7msh4655370a61e105bp13a08djsn1a03179c371b'

    def initialize(api_key = DEFAULT_API_KEY)
      @api_key = api_key
    end

    def price(symbol)
      request("/price?symbol=#{symbol}")
    end

    def prices(symbols)
      request("/prices?symbols=#{symbols}")
    end

    def price_all
      request('/any')
    end

    private

    def request(endpoint)
      url = URI("#{API_BASE_URL}#{endpoint}")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request['x-rapidapi-key'] = @api_key
      request['x-rapidapi-host'] = 'latest-stock-price.p.rapidapi.com'

      response = http.request(request)
      handle_response(response)
    end

    def handle_response(response)
      case response
      when Net::HTTPSuccess
        JSON.parse(response.body)
      else
        raise "Error fetching data: #{response.message}"
      end
    end
  end
end
