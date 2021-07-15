require 'kimurai'
require 'webdrivers'

class Scraper < Kimurai::Base
  @name = 'scraper'
  @start_urls = []
  @page = 1
  @engine = :selenium_firefox
  @config = { before_request: {
    delay: 4..6
  } }

  def self.process(model)
    @@class = model
    @name = @@class.name
    @start_urls = @@class.url
    self.crawl!
  end

  def parse(response, url:, data: {})
    puts 'getting response'
    page = browser.current_response  
    page.xpath("//a[contains(@class, 'productItemLink')]").each do |a|
      puts 'getting link'
      request_to :parse_repo_page, url: absolute_url(a[:href], base: url)
      puts 'next item'
    end
    @page += 1
  end

  def parse_repo_page(response, url:, data: {})
    @@class.parse_repo_page(response)
  end
end