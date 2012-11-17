require 'rubygems'
require 'google-search'

iter = 0

business_graphics = Google::Search::Image.new(:query => 'business graphic')

business_graphics.each do |image|
	if(iter > 500)
		break
	end
	`wget #{image.uri} -P business_graphics`
	iter = iter + 1
end

advertisements = Google::Search::Image.new(:query => 'advertisement')

advertisements.each do |image|
	if(iter > 500)
		break
	end
	`wget #{image.uri} -P business_graphics`
	iter = iter + 1
end

scenes = Google::Search::Image.new(:query => 'scenes')

scenes.each do |image|
	if(iter > 1000)
		break
	end
	`wget #{image.uri} -P scenes`
	iter = iter + 1
end