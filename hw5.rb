require 'mini_magick'
require 'chunky_png'

i = MiniMagick::Image.open("a.jpg")

i.format('png')

p = ChunkyPNG::Image.from_io(StringIO.new(i.to_blob))

count = 0
#p[0, 0] = ChunkyPNG::Color.rgba(255, 0,0, 128)

 #Array.new(8, 0)
vector = Array.new(512, 0)

p.height.times do |y|
  p.width.times do |x|
    iter = p[x,y]
    #puts "#{ChunkyPNG::Color.r(iter).to_s} #{ChunkyPNG::Color.g(iter).to_s} #{ChunkyPNG::Color.b(iter).to_s}" #+ " at " + x.to_s + "," + y.to_s   
    red = ChunkyPNG::Color.r(iter)
    red_index = (red / 32)

    green = ChunkyPNG::Color.g(iter)
    green_index = (green / 32)
    
    blue = ChunkyPNG::Color.b(iter)
    blue_index = (blue / 32)

    vector_index = (red_index * 8 * 8) + (green_index * 8) + blue_index
    vector[vector_index] = vector[vector_index] + 1
    #green_values[green_index] = green_values[green_index] + 1
  end
end

puts vector
