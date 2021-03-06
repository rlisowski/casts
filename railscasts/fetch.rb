require File.expand_path('../../boot', __FILE__)

# http://feeds.feedburner.com/railscasts

doc = Nokogiri::XML(open("http://feeds.feedburner.com/railscasts"))
doc.xpath("//item").each do |item|
  link = item.xpath("enclosure").first["url"]
  name = File.basename(link)

  puts "---", name, link

  `cd #{File.dirname(__FILE__)} && wget -c #{link}`
end

