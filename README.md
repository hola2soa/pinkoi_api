# Pinkoi [![Build Status](https://travis-ci.org/hola2soa/pinkoi_api.svg?branch=master)](https://travis-ci.org/hola2soa/pinkoi_api)

Pinkoi is an ecommerce website but does not have an api.
This API allows the scrapping of the site to extract the title and price
of items sold. The api allows conditions to be specified through the
following parameters: categories, subcategory, location, material,
and price.

Note that pinkoi does not have a robots.txt. checked on(Oct 6, 2015)


## Usage

Install pinkoi api using this command:
```sh
$ gem install pinkoi
```

You can execute it from the command line. Assume you want to get the items
from category 2 with the price range between 200 and 600 the following command
will produce the list of item/price:
```sh
$ pinkoi --category=2 --price=200,600
```
More parameters and examples:
```sh
Usage: pinkoi [options]
      --category=(int)
      --price=[int[,int]]
      --location=[US, JP, HK, CN, TW]
      --subcategory=(int)
      --material=(int[,int,int,...])
      examples:
          pinkoi --category=1 --price=300
          pinkoi --category=1 --price=0,100
          pinkoi --category=1 --subcategory=205 --price=0,100
```

If you want to use it in your library:
```ruby
require 'pinkoi'
scraper = PinkoiScraper::Filter.new
results = scraper.fetch_result('category=3&location=TW')
```