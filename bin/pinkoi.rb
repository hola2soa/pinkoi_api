#!/usr/bin/env ruby
require_relative '../lib/parameter_parser'
require_relative '../lib/scrape'

parser = ParameterParser.new
uri = parser.build_uri
scraper = Scraper::Filter.new

# try just first two pages for now
# later will have users define pages via args
pages = *(1..2)

pages.map do |page|
  paginated_uri = uri + "&page=#{page}"
  scraper.fetch_result(paginated_uri)
end

puts scraper.result
