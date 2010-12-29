require File.expand_path('../../boot', __FILE__)

# http://feeds.feedburner.com/rubyshow
# http://feeds.feedburner.com/railsenvy-podcast
# both links provides the same podcast

doc = Nokogiri::XML(open("http://feeds.feedburner.com/rubyshow"))
doc.xpath("//item").each do |item|
  link = item.xpath("enclosure").first["url"]
  name = File.basename(link)

  puts "---", name, link

  `cd #{File.dirname(__FILE__)} && wget -c #{link}`
end

