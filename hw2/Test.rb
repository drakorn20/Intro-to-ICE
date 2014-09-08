require 'csv'

array_name = Array.new
array_number = Array.new
array_color = Array.new
array_count = [0,0,0]
name = Array.new
name_max = " "
name_min = " "
max_value = 0
min_value = 100
mean_value = 0
most_popular_color = " "
least_popular_color = " "

# assign value from csv to each array
CSV.foreach('data.csv', converters: :numeric) do |row|
 	array_name << row[0]
 	array_number << row[1]
	array_color << row[2]
end

for i in 1..5	

	#find max value
	if max_value<array_number[i]
		max_value = array_number[i]
		name_max = array_name[i]
	end

	#find min value
	if min_value>array_number[i]
		min_value = array_number[i]
		name_min = array_name[i]
	end

	#find mean value
	mean_value += array_number[i]
	mean_value /= 5

	#find most and least popular color
	if array_color[i]=="Red" 
		array_count[0]+=1
	elsif array_color[i]=="Blue" 
		array_count[1]+=1
	elsif array_color[i]=="Yellow" 
		array_count[2]+=1
	end


	#capitalize name
	name[i] = array_name[i].reverse.split.map(&:capitalize).join(' ').reverse

end

	#specify most popular color
	if array_count[0]>array_count[1]&&array_count[0]>array_count[2]
		most_popular_color="Red"
	elsif array_count[1]>array_count[0]&&array_count[1]>array_count[2]
		most_popular_color="Blue"
	elsif array_count[2]>array_count[1]&&array_count[2]>array_count[0]
		most_popular_color="Yellow"
	end

	#specify least popular color
	if array_count[0]<array_count[1]&&array_count[0]<array_count[2]
		least_popular_color="Red"
	elsif array_count[1]<array_count[0]&&array_count[1]<array_count[2]
		least_popular_color="Blue"
	elsif array_count[2]<array_count[1]&&array_count[2]<array_count[0]
		least_popular_color="Yellow"
	elsif array_count[0]==array_count[2]&&array_count[0]<array_count[1]
		least_popular_color="Red Yellow"
	end

puts "Highest score: #{name_max} => score #{max_value}"
puts "Lowest score: #{name_min} => score #{min_value}"
puts "Mean of all students' scores: #{mean_value}"
puts "Most popular color: #{most_popular_color}"
puts "Least popular color: #{least_popular_color} "
print "All students' name:"
name.each {|x| puts " #{x}"}