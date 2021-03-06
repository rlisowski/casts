require File.expand_path('../../boot', __FILE__)

# http://feeds.feedburner.com/Ruby5

doc = Nokogiri::XML(open("http://feeds.feedburner.com/Ruby5"))
doc.xpath("//item").each do |item|
  link = item.xpath("enclosure").first["url"]
  name = File.basename(link).split('?').first # remove params

  puts "---", name, link

  `cd #{File.dirname(__FILE__)} && wget -O #{name} -c #{link}`
end

