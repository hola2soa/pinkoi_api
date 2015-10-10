#!/usr/bin/env ruby
require 'oga'
require 'open-uri'

module Scraper
  # scrape data
  class Filter
    attr_reader :result
    private
    ITEM_SELECTOR = "//div[contains(@class,\'items\')]/div"
    TITLE_SELECTOR = "div[contains(@class,\'title\')]"
    PRICE_SELECTOR = "div[@class=\'info\']/div[@class=\'price\']"

    def get_xmldata(url)
      begin
        raw_html = open(url)
        doc = Oga.parse_html(raw_html)

      rescue Exception
        "error"
      end
    end

    public
    def initialize
      @result = []
    end

    def fetch_result(url)
      document = get_xmldata(url)
      return [] unless document != "error"

      items = document.xpath(ITEM_SELECTOR)
      items.map do |item|
        title = item.xpath(TITLE_SELECTOR).text
        price = item.xpath(PRICE_SELECTOR).text
        @result <<
        {:title => "#{title}", :price => "#{price}"} unless title.empty?
      end
      result
    end
  end
end
