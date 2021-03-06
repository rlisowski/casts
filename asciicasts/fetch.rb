require File.expand_path('../../boot', __FILE__)

# http://asciicasts.com/episodes.xml
#<?xml version="1.0" encoding="UTF-8"?>
#<rss version="2.0">
#  <channel>
#    <title>ASCIIcasts - Latest Episodes</title>
#    <description>The latest episodes from ASCIIcasts</description>
#    <link>http://asciicasts.com/</link>
#    <pubDate>Sun, 27 Jun 2010 21:48:33 +0000</pubDate>
#    <ttl>1440</ttl>
#    <item>
#      <title>Active Model</title>
#      <description>In Rails 3 the non-database functionality of Active Record is extracted out into Active Model. This allows you to cleanly add validations and other features to tableless models.</description>
#      <pubDate>Mon, 21 Jun 2010 22:24:29 +0000</pubDate>
#      <guid>http://asciicasts.com/episodes/219-active-model</guid>
#      <link>http://asciicasts.com/episodes/219-active-model</link>
#    </item>

doc = Nokogiri::XML(open("http://asciicasts.com/episodes.xml"))
doc.xpath("//item").each do |item|
  link = item.xpath("link").first.text
  page = Nokogiri::XML(open(link))
  link = page.css("#otherFormats a").first[:href].gsub(/\?\d+$/, '')
	name = File.basename(link)

  puts "---", name, link

  `cd #{File.dirname(__FILE__)} && wget -c #{link}`

end
