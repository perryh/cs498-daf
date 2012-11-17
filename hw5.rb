require 'mini_magick'
require 'chunky_png'

Dir.foreach(ARGV[0]) do |img_file|
    if(img_file == '.' || img_file == '..') then
        next
    end
    i = MiniMagick::Image.open("#{ARGV[0]}/#{img_file}")

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

    #puts vector.length
    vector_string = String.new

    vector.each_with_index {|val, index|
=begin
        if(val == 0)
            vector.delete_at(index) 
        elsif(val < (p.height * p.width ))
            vector.delete_at(index)
        end
=end
        if(index == vector.length - 1)
            vector_string = vector_string + val.to_s
            next
        end
        vector_string = vector_string + val.to_s + ","
    }
    puts vector_string
end