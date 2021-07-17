class Gpu < ApplicationRecord
  has_many :build_gpus, dependent: :destroy
  has_many :builds, through: :build_gpus

  def self.name
    @name = 'gpus'
  end

  def self.url
    @start_urls = ["https://pangoly.com/en/browse/vga?page=#{@page}"]
  end

  def self.parse_repo_page(response)
    item = {}
    @table = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody")
    item[:core_clock] = get_int('GPU Clock Rate')
    item[:boost_clock] = get_int('GPU Boost Clock Rate')
    item[:chipset] = get_text('GPU Chipset')
    item[:length] = get_text('Length')
    item[:price] = response.xpath("//span[@class='price']").text.tr('^0-9.', '').to_f
    item[:name] = response.xpath("//div[contains(@class, 'product-info')]").css('h2').text
    item[:image] = response.xpath("//img[@class='nivo-main-image']").attr('src').value
    item[:memory_size] = get_text('GPU Memory Size')
    item[:memory_type] = get_text('GPU Memory Type')
    byebug
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
