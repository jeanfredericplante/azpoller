require 'rubygems'
require 'open-uri'
require 'nokogiri'

url = "http://www.amazon.com/Logitech-915-000194-Harmony-Control-Smartphone/dp/B00BQ5RYI4/ref=sr_1_1?ie=UTF8&qid=1383536405&sr=8-1&keywords=harmony"

begin
 doc = Nokogiri::HTML(open(url, &:read))
 frequently_bought_together_div = JSON.parse(doc.xpath("//*[@id='fbt_item_data']").text)
 price_in_cents = frequently_bought_together_div["itemData"][0]["buyingPrice"] * 100 # getting the first item of the frequently bought together array
 
 return price_in_cents.to_i

rescue Exception => e
  print e, "\n"
end

