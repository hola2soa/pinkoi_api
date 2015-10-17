
pinkoi.gemspec
Gem::Specification.new do |s|
  s.name        = 'pinkoi'
  s.version     = '0.0.0'
  s.date        = '2015-10-17'
  s.summary     = 'a pinkoi scraper'
  s.description = 'this is a gem scraping pinkoi's website and returb the first two pages of items'
  s.authors     = ["holasoa2015"]
  s.email       = 'holasoa2015@gmail.com'
  s.files       = ["lib/pinkoi.rb", "lib/pinkoi/scrape.rb", "lib/pinkoi/parameter_parser.rb"]
  s.executables << 'pinkoi'	
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license       = 'MIT'
end
