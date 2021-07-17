class Cpu < ApplicationRecord
  has_many :builds, dependent: :destroy

  def self.name
    @name = 'cpus'
  end

  def self.url
    @start_urls = ["https://pangoly.com/en/browse/cpu?page=#{@page}"]
  end

  def self.parse_repo_page(response)
    item = {}
    @table = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody")
    item[:socket] = get_text('Socket')
    item[:core_count] = get_int('CPU Cores')
    item[:core_clock] = get_int('CPU Clock Rate')
    item[:boost_clock] = get_int('CPU Turbo Clock Rate')
    item[:tdp] = get_text('TDP')
    item[:price] = response.xpath("//span[@class='price']").text.tr('^0-9.', '').to_f
    item[:name] = response.xpath("//div[contains(@class, 'product-info')]").css('h2').text
    item[:image] = response.xpath("//img[@class='nivo-main-image']").attr('src').value
    item[:max_memory] = get_text('Maximum Supported Memory')
    find_or_create_by(item)
  end

  def self.get_text(column)
    info = @table.css('tr').xpath("//strong[text()='#{column}']").xpath('..').xpath('..').css('td')[1]
    return nil unless info

    info.text.squish
  end

  def self.get_int(column)
    info = @table.css('tr').xpath("//strong[text()='#{column}']").xpath('..').xpath('..').css('td')[1]
    return nil unless info

    info.text.squish.to_i
  end

  def self.get_arr(column)
    info = @table.css('tr').xpath("//strong[text()='#{column}']").xpath('..').xpath('..').css('td')[1]
    return nil unless info

    info.css('ul/li').map(&:text)
  end
end
