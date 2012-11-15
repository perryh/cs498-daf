require 'mini_magick'
require 'chunky_png'

i = MiniMagick::Image.open("a.jpg")

i.format('png')

p = ChunkyPNG::Image.from_io(StringIO.new(i.to_blob))

p.height.times do |y|
  p.width.times do |x|
    p[x, y]  # => here's your pixel..
  end
end
