require 'scraper'
require 'byebug'

class Cpu < Scraper

  @name = 'cpu_scraper'
  @start_urls = ["https://pcpartpicker.com/products/cpu/fetch/?xcx=0&page=1&mode=list&xslug=&search="]
  @last = ''
  @config = { before_request: {
    delay: 4..6
  } }

  def parse(response, url:, data: {})
    sleep 5.seconds
    puts 'getting response'
    page = browser.current_response  
    puts page
    page.xpath("//tr[contains(@class, 'tr__product')]").each do |cpu|
    # response.xpath("//tr").each do |cpu|
      puts 'in the loop'
      item = {}
      @last = cpu
      byebug

      # Cpu.find_or_create_by(item)
    end
  end
end
