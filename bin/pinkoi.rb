#!/usr/bin/env ruby
require 'pinkoi' # for production
# require_relative '../lib/pinkoi.rb' # for testing

parser = ParameterParser.new
uri = parser.build_uri
scraper = PinkoiScraper::Filter.new

# try just first two pages for now
# later will have users define pages via args
pages = *(1..2)

pages.map do |page|
  paginated_uri = uri + "&page=#{page}"
  scraper.fetch_result(paginated_uri)
end

puts scraper.result
