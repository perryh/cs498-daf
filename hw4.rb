require 'descriptive_statistics'
require 'integration'

positives = 0
num_runs = 0
1000.times do
fraction = 0.0
heights = "67.75
72.25
66.25
72.25
71.25
74.75
69.75
72.50
74.00
73.50
74.50
76.00
69.50
71.25
69.50
66.00
71.00
71.00
67.75
73.50
68.00
69.75
68.25
70.00
67.75
71.50
67.50
67.50
64.75
69.00
73.75
71.25
71.25
71.00
73.50
65.00
70.00
68.25
72.25
67.00
68.75
29.50
70.00
71.50
68.00
73.25
67.50
71.25
68.50
66.75
72.25
69.00
67.75
73.50
67.50
72.00
68.00
69.50
70.75
65.75
73.25
68.50
70.25
67.00
70.00
67.50
70.75
71.50
69.25
71.50
71.50
68.75
73.75
64.00
65.75
67.50
69.50
68.50
70.25
69.25
67.75
67.25
72.75
70.00
69.25
67.50
67.25
65.75
72.50
73.00
70.00
69.50
70.50
71.75
74.50
77.75
73.25
66.50
68.25
72.00
73.50
72.00
71.25
73.75
69.25
68.50
73.50
74.25
75.50
69.25
68.50
70.00
70.00
70.25
71.75
69.25
72.75
72.00
74.00
72.25
74.50
71.50
68.75
66.75
66.50
67.00
68.75
67.75
73.25
69.75
71.50
70.50
73.25
66.75
69.50
69.75
70.75
74.00
71.25
75.00
71.00
69.50
67.75
72.25
77.50
70.75
72.75
69.75
72.50
70.25
69.00
74.50
72.25
67.25
73.50
75.25
69.00
72.25
68.75
71.50
72.25
73.00
68.75
70.50
72.00
73.75
68.00
72.25
69.50
69.50
67.75
65.50
71.00
71.50
71.75
69.25
67.00
71.50
69.25
74.50
74.25
68.00
67.25
69.75
74.25
71.50
74.25
72.00
72.50
68.25
69.25
76.00
70.50
74.75
72.75
68.25
69.00
71.50
72.75
67.50
70.25
69.25
71.50
74.00
69.75
73.00
65.50
72.50
70.25
70.75
68.00
74.50
71.75
70.75
73.00
64.00
69.75
70.00
71.75
69.25
70.50
72.25
67.50
67.25
68.75
66.75
68.25
74.25
69.50
68.50
65.75
71.75
71.50
67.25
67.50
67.50
72.25
69.50
69.50
65.75
65.75
68.25
72.00
72.75
68.50
69.25
70.50
67.00
69.75
66.00
70.50
70.00"
heights2 = heights
heights = heights.split("\n")

array_30 = Array.new
rand_num = 0
until array_30.length == 30 do
	rand_num = rand(0...251)
	array_30 << heights[rand_num].to_i
	heights.delete_at(rand_num)
end



heights2 = heights2.split("\n")


array_30_2 = Array.new
rand_num_2 = 0
until array_30_2.length == 30 do
	rand_num_2 = rand(0...251)
	array_30_2 << heights[rand_num_2].to_i
	heights2.delete_at(rand_num_2)
end

std1 = array_30.standard_deviation
std2 = array_30_2.standard_deviation
stde1 = std1 / Math.sqrt(252)
stde2 = std2 / Math.sqrt(252)
standard_error = Math.sqrt((stde1**2) + (stde2**2))

difference = array_30.mean - array_30_2.mean

test_statistic = (difference / standard_error)

#puts array_30.mean
#puts array_30_2.mean
#puts "-----"

#puts test_statistic

integral_value = Integration.integrate(test_statistic, 100000,{:tolerance=>1e-10,:method=>:adaptive_quadrature}) {|x| Math.exp(((-x**2)/2))}

val = (2/Math.sqrt(2*Math::PI)) * integral_value

#puts val

if(val < 0.05)
#	puts "true"
	positives = positives + 1
end

#num_runs = num_runs + 1

#fraction = ((positives/num_runs))
#puts fraction
#puts (fraction * 100.0).to_s + "%"

end

puts positives
#puts positives/1000
puts "done"