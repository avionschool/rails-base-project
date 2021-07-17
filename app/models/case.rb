class Case < ApplicationRecord
  has_many :builds, dependent: :destroy

  def self.name
    @name = 'case'
  end

  def self.url
    @start_urls = ["https://pangoly.com/en/browse/case?page=#{@page}"]
  end

  def self.parse_repo_page(response)
    puts('getting info')
    item = {}
    @table = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody")
    item[:form_factor] = self.get_text('Type')
    item[:color] = self.get_text('Color')
    item[:power_supply] = @table.css('tr').xpath("//strong[text()='Includes Power Supply']").xpath('..').xpath('..').css('td')[1].css('span').attr('title').value
    if item[:power_supply] == "Yes"
      item[:power_supply] = true
    elsif item[:power_supply] == "No"
      item[:power_supply] = false
    else
      item[:power_supply] = nil
    end
    item[:bay_2_5] = self.get_int('Internal 2.5" Drive Bays')
    item[:bay_3_5] = self.get_int('Internal 3.5" Drive Bays')
    item[:price] = response.xpath("//span[@class='price']").text.tr('^0-9.', '').to_f
    item[:name] = response.xpath("//div[contains(@class, 'product-info')]").css('h2').text
    item[:image] = response.xpath("//img[@class='nivo-main-image']").attr('src').value
    item[:motherboard_form_factor] = self.get_text('Motherboard Compatibility').split(',')
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
