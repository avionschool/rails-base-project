require 'kimurai'
require 'webdrivers'

class Scraper < Kimurai::Base
  @page = 1
  @engine = :selenium_firefox
  @config = { before_request: {
    delay: 2..4
  } }

  def self.process(model)
    @@class = model
    @name = @@class.name
    @start_urls = @@class.url
    crawl!
  end

  def parse(response, url:, data: {})
    products = response.xpath("//a[contains(@class, 'productItemLink')]")
    return if products.empty?

    products.each do |_a|
      request_to :parse_repo_page, url: absolute_url(_a[:href], base: url)
    end
    @page += 1
  end

  def parse_repo_page(response, url:, data: {})
    @@class.parse_repo_page(response)
  end
end
