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

require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'pdfkit'

doc = Nokogiri::XML(open("http://asciicasts.com/episodes.xml"))
doc.xpath("//item").each do |item|
  link = item.xpath("link").first.text
  name = File.basename(link)
  next if File.exists?(File.join(File.dirname(__FILE__), "#{name}.pdf"))

  puts "---", name, link

  kit = PDFKit.new(link, :proxy => "http://proxy.non.3dart.com:3128")

  # Save the PDF to a file
  file = kit.to_file(File.join(File.dirname(__FILE__), "#{name}.pdf"))
end
