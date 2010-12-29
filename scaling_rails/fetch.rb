require File.expand_path('../../boot', __FILE__)

# http://feeds.feedburner.com/Scaling-Rails

doc = Nokogiri::XML(open("http://feeds.feedburner.com/Scaling-Rails"))
doc.xpath("//item").each do |item|
  link = item.xpath("enclosure").first
  next unless link
  link = link["url"]
  name = File.basename(link)

  puts "---", name, link

  `cd #{File.dirname(__FILE__)} && wget -c #{link}`
end

