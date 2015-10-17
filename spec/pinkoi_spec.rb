require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require 'vcr'
require 'webmock/minitest'
require './lib/parameter_parser'
require './lib/scrape'


VCR.configure do |config|
	config.cassette_library_dir = './spec/testfiles/vcr_cassettes'
	config.hook_into :webmock
end

VCR.use_cassette 'pinkoi1' do
	describe 'pinkoi' do
		before do
			@scraper = Scraper::Filter.new
		end

		describe 'fetch items from category 2' do
			before do
				VCR.insert_cassette 'category 2'
			end

			after do
				VCR.eject_cassette
			end

			it 'structure check' do
				items = @scraper.fetch_result('category=2')

				items.must_be_instance_of       Array
				items.wont_be_empty
				items.first.must_be_instance_of Hash
				items.wont_be_empty

				items.first[:title].wont_be_nil
				items.first[:title].must_be_instance_of String
				items.first[:price].wont_be_nil
				items.first[:price].must_be_instance_of String
			end
		end

	end
end
