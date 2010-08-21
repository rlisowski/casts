#http://feeds2.feedburner.com/sdrbpodcast

require 'rubygems'
require 'open-uri'
require 'nokogiri'

doc = Nokogiri::XML(open("http://feeds2.feedburner.com/sdrbpodcast"))
doc.xpath("//item").each do |item|
  link = item.xpath("enclosure").first["url"]
  name = File.basename(link)

  puts "---", name, link

  `cd #{File.dirname(__FILE__)} && wget -c #{link}`
end

