class Cpu < ApplicationRecord
  def self.name
    @name = 'cpus'
  end

  def self.url
    @start_urls = ["https://pangoly.com/en/browse/cpu?page=#{@page}"]
  end

  def self.parse_repo_page(response)
    puts('getting info')
    item = {}
    item[:socket] = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody").css('tr').xpath("//strong[text()='Socket']").xpath('..').xpath('..').css('td')[1].text.squish
    item[:core_count] = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody").css('tr').xpath("//strong[text()='CPU Cores']").xpath('..').xpath('..').css('td')[1].text.squish.to_i
    item[:core_clock] = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody").css('tr').xpath("//strong[text()='CPU Clock Rate']").xpath('..').xpath('..').css('td')[1].text.squish.to_i
    item[:boost_clock] = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody").css('tr').xpath("//strong[text()='CPU Turbo Clock Rate']").xpath('..').xpath('..').css('td')[1].text.squish.to_i
    item[:tdp] = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody").css('tr').xpath("//strong[text()='TDP']").xpath('..').xpath('..').css('td')[1].text.squish
    item[:price] = response.xpath("//span[@class='price']").text.tr('^0-9.', '').to_f
    self.find_or_create_by(item)
  end
end
