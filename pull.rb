require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'json'

url = "http://www.amazon.com/Logitech-915-000194-Harmony-Control-Smartphone/dp/B00BQ5RYI4/ref=sr_1_1?ie=UTF8&qid=1383536405&sr=8-1&keywords=harmony"
url = "http://www.amazon.com/gp/product/B004Y1AYAC/ref=s9_simh_gw_p421_d0_i1?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=center-4&pf_rd_r=0YZ6D17J2F6X8P5DW50D&pf_rd_t=101&pf_rd_p=1630072182&pf_rd_i=507846"

begin
 doc = Nokogiri::HTML(open(url, &:read))
 frequently_bought_together_div = JSON.parse(doc.xpath("//*[@id='fbt_item_data']").text)
 price_in_cents = frequently_bought_together_div["itemData"][0]["buyingPrice"] * 100 # getting the first item of the frequently bought together array
 
 puts price_in_cents.to_i

rescue Exception => e
  -1
end

