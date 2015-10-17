#!/usr/bin/env ruby
require 'oga'
require 'open-uri'

# scrape data
module PinkoiScraper
  # filter class basically uses xpath selectors to get attribs
  class Filter
    attr_reader :result
    attr_writer :item_selector
    attr_writer :title_selector
    attr_writer :price_selector
    attr_writer :site_url

    private

    def get_xmldata(url)
      raw_html = open(url)
      Oga.parse_html(raw_html)
    rescue StandardError
      'error'
    end

    public

    def initialize
      @result = []
      # xml selectors that will be used to scrape data
      @item_selector = "//div[contains(@class,\'items\')]/div"
      @title_selector = "div[contains(@class,\'title\')]"
      @price_selector = "div[@class=\'info\']/div[@class=\'price\']"
      @site_url = 'http://www.pinkoi.com/browse?'
    end

    def fetch_result(uri = 'category=1')
      url = @site_url + uri
      # try to open the url
      document = get_xmldata(url)
      # hard return on an error
      return [] unless document != 'error'

      items = document.xpath(@item_selector)
      # loop through the items and get the title and price
      items.map do |item|
        title = item.xpath(@title_selector).text
        price = item.xpath(@price_selector).text
        @result << { title: "#{title}", price: "#{price}" } unless title.empty?
      end
      result
    end
  end
end
