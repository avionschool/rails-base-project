class Case < ApplicationRecord
  has_many :builds, dependent: :destroy
  serialize :internal_bays

  def self.name
    @name = 'case'
  end

  def self.url
    @start_urls = ["https://pangoly.com/en/browse/case?page=#{@page}"]
  end

  def self.parse_repo_page(response)
    item = {}
    @table = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody")
    item[:form_factor] = get_text('Type')
    item[:color] = get_text('Color')
    item[:power_supply] = @table.css('tr').xpath("//strong[text()='Includes Power Supply']").xpath('..').xpath('..').css('td')[1].css('span').attr('title').value
    item[:power_supply] = case item[:power_supply]
                          when 'Yes'
                            true
                          when 'No'
                            false
                          end
<<<<<<< HEAD
    item[:internal_bays] = { 'bay2.5' => get_int('Internal 2.5" Drive Bays'), 'bay3.5' => get_int('Internal 3.5" Drive Bays') }
=======
    item[:internal_bay_small] = get_int('Internal 2.5" Drive Bays')
    item[:internal_bay_large] = get_int('Internal 3.5" Drive Bays')
>>>>>>> 223eed4e8c5c209dfd763f997bcbf897dc8ca3a8
    item[:price] = response.xpath("//span[@class='price']").text.tr('^0-9.', '').to_f
    item[:name] = response.xpath("//div[contains(@class, 'product-info')]").css('h2').text
    item[:image] = response.xpath("//img[@class='nivo-main-image']").attr('src').value
    item[:motherboard_form_factor] = get_text('Motherboard Compatibility').split(',')
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
