require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require_relative '../lib/parameter_parser'
require_relative '../lib/scrape'

scraper = Scraper::Filter.new

items_from_file = YAML.load(File.read('./testfiles/items.yml'))
items_found = scraper.fetch_result('category=2')

describe 'get itmes form category2' do
	items_from_file['category2'].each do |item_from_file|
		# item_from_file.keys has only one key which is item's title
		# and has only one value which is item's price
		it "finds '#{item_from_file.keys}' item" do
			items_found.each do |item_found|
				#search for the same title name ,and then compare the prices
				if item_found[:title] == item_from_file.keys[0]
					item_found[:price].must_equal item_from_file.values[0]
				# search for the same title name, and then compare the prices
				if item_found[:title] == item_from_file.keys
					item_found[:price].must_equal item_from_file.values
				end
			end
		end
	end
end
