#!/usr/bin/env ruby
require 'oga'
require 'open-uri'
require_relative '../lib/parameter_parser'

base_url = "http://www.pinkoi.com/browse?"
parser = ParameterParser.new
url = base_url + parser.build_uri

# try just first two pages for now
# later will have users define pages via args
pages =* (1..2);

pages.map do |page|
  paginated_url = url + "&page=#{page}"
  puts paginated_url
  begin
    raw_html = open(paginated_url)
    document = Oga.parse_html(raw_html)

    items = document.xpath("//div[contains(@class,'items')]/div")
    items.map do |item|
      puts "Title: #{item.xpath('div[contains(@class,\'title\')]').text}"
      puts "Price: #{item.xpath('div[@class=\'info\']/div[@class=\'price\']').text}"
      puts
    end
  rescue Exception => e
    break # likely a 404 error
  end
end
