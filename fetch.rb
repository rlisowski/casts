require File.expand_path('../boot', __FILE__)

# go into each directory and run fetch script
dir = Dir.new(File.dirname(__FILE__))
dir.each do |subdir|
	next unless File.directory?(subdir) && subdir !~ /\..?/
	require File.expand_path('fetch', File.join(File.dirname(__FILE__), subdir))
end
