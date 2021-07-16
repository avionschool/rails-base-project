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
    puts('getting info')
    item = {}
    @table = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody")
    item[:core_clock] = self.get_int('GPU Clock Rate')
    item[:boost_clock] = self.get_int('GPU Boost Clock Rate')
    item[:chipset] = self.get_text('GPU Chipset')
    item[:length] = self.get_text('Length')
    item[:price] = response.xpath("//span[@class='price']").text.tr('^0-9.', '').to_f
    byebug
    self.find_or_create_by(item)
  end

  def self.get_text(column)
    info = @table.css('tr').xpath("//strong[text()='#{column}']").xpath('..').xpath('..').css('td')[1]
    return nil unless info
    return info.text.squish
  end

  def self.get_int(column)
    info = @table.css('tr').xpath("//strong[text()='#{column}']").xpath('..').xpath('..').css('td')[1]
    return nil unless info
    return info.text.squish.to_i
  end

  def self.get_arr(column)
    info = @table.css('tr').xpath("//strong[text()='#{column}']").xpath('..').xpath('..').css('td')[1]
    return nil unless info
    return info.css('ul/li').map{ |item| item.text }
  end
end
