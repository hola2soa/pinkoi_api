## Pinkoi Scrape API:

The Filter class is hosted by the Scraper module. To create an instance of the Filter class, first, you need to include
the file that contains the module using `require_relative '../lib/scrape'`. Assuming you are following the 
file strucure provided in the project.

Then you can instantiate the class `scraper = Scrapper::Filter.new`

The Scraper instance by default initializes the selectors to the following values

```
@item_selector = "//div[contains(@class,\'items\')]/div"
@title_selector = "div[contains(@class,\'title\')]"
@price_selector = "div[@class=\'info\']/div[@class=\'price\']" 
```

but using the setters for the respective variables this can be changed. Of course, you must
appropriately define the selectors to get data. Be careful since there is no validator
for the selectors, yet. Sit tight, if you asked for it you will get it ;)

There is a variable which is called `@site_url` this means you can change the base url of the site
and scrape another site as oppose to the default `http://www.pinkoi.com/browse?`. Then you will be
forced to change the xml selectors respectively for that site.

### Getting the results:

using the instance variable you can now call `fetch_result` function like this:
`scraper.get_result()` to get the result. By default you will get results from category 1
which is the default uri passed into `get_results`.

Optionally, you can pass a string representing the uri. The format of the uri is `key=value`
optionally adding as many key/value pairs separated by & sign for example:

```
scraper.get_result('category=3&price=300&location=TW')
```

This will return an array of hashes containing title and price keys with respective values
for example:
```
[{:title=>"Allyn Cream", :price=>"NT$2155"},
{:title=>"手工縫製真皮 背帶兩用小方包 原色款 S號 [June 27 調整]", :price=>"NT$2180"},
{:title=>"[CURLY CURLY] 青空/束口後背包 (共四色)", :price=>"NT$630"},
{:title=>"OLI13 德比DERBY-藍黃帆布鞋│男", :price=>"NT$2680"},
{:title=>"水桶隨身側背包 - 黑色", :price=>"NT$505"},
{:title=>"INNER | 圓圓交集  手提肩背胚布包", :price=>"NT$290"},
{:title=>"Dessin x monopoly-少女尼龍兩用包-海軍藍,MPL22242", :price=>""},
{:title=>"植鞣真牛皮手工零錢包/皮夾，共五色", :price=>"NT$1600"},
{:title=>"[足袋日]京都黑花布/素雅小花內裏/可反摺兩穿式足袋平底鞋/經典和風鞋款/素色款", :price=>"NT$1680"},
{:title=>"Southgate 南登機口 FREE 奶茶 簡單舒適 國民休閒鞋台灣良品(帆布鞋/懶人/休閒鞋)", :price=>"NT$1480"},
{:title=>"三明治隨身側背包 - 午夜黑", :price=>"NT$415"},
{:title=>"humming-森林女神 Embroidery Purse〈零錢包〉藏青緞面", :price=>"NT$280"},
{:title=>"Ix Style Woven Leather Huarache Sandal in Beige 手工編織鞋 - 米白色 US 7", :price=>"NT$3000"},
{:title=>"California White", :price=>"NT$2475"}]
```

