require 'rubygems'

# Set up gems listed in the Gemfile.
gemfile = File.expand_path('../Gemfile', __FILE__)
puts gemfile
begin
  ENV['BUNDLE_GEMFILE'] = gemfile
  require 'bundler'
  Bundler.setup(:default)
rescue Bundler::GemNotFound => e
  puts e.message
  puts "Try running `bundle install`."
  exit!
end if File.exist?(gemfile)

require 'nokogiri'
require 'open-uri'
require 'pdfkit'

