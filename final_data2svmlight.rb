input = File.new(ARGV[0], "r")
#output = File.new(ARGV[1], "w")

#puts input.gets.split(" ")

line = input.gets
season = 0
counter = 0

while(line != nil)
	counts = Hash.new(0)
	output = String.new
	line.split(" ").each do |i|
		counts[i] += 1
	end
	counts = counts.sort_by { |k, v| k.to_i}
	output += season.to_s
	counts.each do |k, v|
		output += " " + k.to_s + ":" + v.to_s
	end
	puts output
	line = input.gets
	counter += 1
	if(counter == 25)
		season += 1
		counter = 0
	end
end