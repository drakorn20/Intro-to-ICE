require 'sinatra'
require 'timezone'

get '/timezone' do
	erb :interface
end

post '/timezone' do

	cityInput = params[:message]
	cityInput.capitalize
	if cityInput.include? " "
		cityInput[" "] = "_"
	end
	timezones = Timezone::Zone.names
	This_city = timezones.find{
		|e|/#{cityInput}/ =~e 
	}
	This_timezone = Timezone::Zone.new :zone => This_city
	time_display = This_timezone.time Time.now
	array = time_display.to_s.split(' ')
	time = array[1].split(':')
	hrs = time[0]
	mins = time[1]

	if cityInput.include? "_"
		cityInput["_"] = " "
	end


	if hrs.to_i > 12
		hours = hrs.to_i - 12
		"The current time in #{cityInput} is: #{hours}:#{mins} PM"
	else
		"The current time in #{cityInput} is: #{hrs}:#{mins} AM"
	end
end