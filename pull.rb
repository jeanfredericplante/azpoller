require 'rubygems'
require 'open-uri'
require 'hpricot'


@url = "http://www.amazon.com/Logitech-915-000194-Harmony-Control-Smartphone/dp/B00BQ5RYI4/ref=sr_1_1?ie=UTF8&qid=1383536405&sr=8-1&keywords=harmony"
@response = ''

begin

  open(@url, "User-Agent" => "Ruby/#{RUBY_VERSION}",
  "From" => "example@gmail.com",
  "Referer" => "") { |f|
    puts "Fetched document: #{f.base_uri}"
    puts "\t Content Type: #{f.content_type}\n"
    puts "\t Charset: #{f.charset}\n"
    puts "\t Content-Encoding: #{f.content_encoding}\n"
    puts "\t Last Modified: #{f.last_modified}\n\n"

    # Save the response body
    @response = f.read
  }
  
  puts @response
  
  doc = Hpricot(@response)

rescue Exception => e
  print e, "\n"
end

