require 'rubygems'
require 'open-uri'
require 'nokogiri'
require "selenium-webdriver"
require 'money'

driver = Selenium::WebDriver.for :safari


url = "http://www.amazon.com/Logitech-915-000194-Harmony-Control-Smartphone/dp/B00BQ5RYI4/ref=sr_1_1?ie=UTF8&qid=1383536405&sr=8-1&keywords=harmony"

begin
  driver.navigate.to url
  price = driver.find_element(:id, 'priceblock_ourprice')
  price_decimal= price.text.gsub(/[^\d.,'-]/, '')         # remove anything that's not a number, potential thousands_separator, or minus sign
  price_decimal.chop! if price_decimal.match(/[\.|,]$/) #if the number ends with punctuation, just throw it out.
  puts price_cents = price_decimal.gsub(".","").to_i

rescue Exception => e
  print e, "\n"
end

