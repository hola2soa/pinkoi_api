#!/usr/bin/env ruby
require_relative '../lib/parameter_parser'
require_relative '../lib/scrape'

base_url = "http://www.pinkoi.com/browse?"
parser = ParameterParser.new
url = base_url + parser.build_uri
scraper = Scraper::Filter.new

# try just first two pages for now
# later will have users define pages via args
pages =* (1..2);

pages.map do |page|
  paginated_url = url + "&page=#{page}"
  puts paginated_url
  scraper.fetch_result(paginated_url)
end

puts scraper.result
