class CaseFan < ApplicationRecord
  has_many :build_case_fans, dependent: :destroy
  has_many :builds, through: :build_case_fans

  def self.name
    @name = 'case_fans'
  end

  def self.url
    @start_urls = ["https://pangoly.com/en/browse/case-fan?page=#{@page}"]
  end

  def self.parse_repo_page(response)
    item = {}
    @table = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody")
    item[:size] = get_text('Fan Size')
    item[:color] = get_text('Color')
    item[:airflow] = get_text('Air Flow')
    item[:rpm] = get_text('Fan RPM')
    item[:price] = response.xpath("//span[@class='price']").text.tr('^0-9.', '').to_f
    item[:name] = response.xpath("//div[contains(@class, 'product-info')]").css('h2').text
    item[:image] = response.xpath("//img[@class='nivo-main-image']").attr('src').value
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
