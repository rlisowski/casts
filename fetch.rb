# go into each directory and run fetch script
dir = Dir.new(File.dirname(__FILE__))
dir.each do |subdir|
	next unless File.directory?(subdir) && subdir !~ /\..?/
	`ruby #{File.join(File.dirname(__FILE__), subdir, 'fetch.rb')}`
end
