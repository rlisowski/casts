require File.expand_path('../../boot', __FILE__)

#http://feeds2.feedburner.com/sdrbpodcast

doc = Nokogiri::XML(open("http://feeds2.feedburner.com/sdrbpodcast"))
doc.xpath("//item").each do |item|
  link = item.xpath("enclosure").first["url"]
  name = File.basename(link)

  puts "---", name, link

  `cd #{File.dirname(__FILE__)} && wget -c #{link}`
end

