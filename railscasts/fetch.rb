# http://feeds.feedburner.com/railscasts

require 'rubygems'
require 'open-uri'
require 'nokogiri'

doc = Nokogiri::XML(open("http://feeds.feedburner.com/railscasts"))
doc.xpath("//item").each do |item|
  link = item.xpath("enclosure").first["url"]
  name = File.basename(link)
  next if File.exists?("./#{name}")

  puts "---", name, link

  `cd #{File.dirname(__FILE__)} && wget -c #{link}`
end

