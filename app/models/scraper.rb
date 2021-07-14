require 'kimurai'
require 'webdrivers'

class Scraper < Kimurai::Base
  @name = ''
  @start_urls = []
  @engine = :selenium_firefox
  # @config = {
  #   user_agent: "Chrome/68.0.3440.84"
  # }

  def self.process()
    self.crawl!
  end
end