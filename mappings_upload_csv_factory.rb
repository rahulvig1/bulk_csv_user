require 'faker'
require 'csv'
require 'facets/date'
require 'date'

csv_filename  = 'mappings_upload' + Time.now.to_i.to_s + '.csv'
no_of_activities = 100
internal_attendees_file_name = 'internal_users_upload1525763272.csv'
room_file_name = 'room_upload1525762198.csv'

internal_attendees_array = CSV.table(internal_attendees_file_name)[:email_]
room_list = CSV.table(room_file_name)[:name_]
start_date = '2018-04-30'
end_date = '2020-04-30'
duration = 60
topics = ["bug", "go", "trebble"]
meeting_type = "General Meeting"

 CSV.open(csv_filename, "wb") do |csv|
   csv << ["Meeting Type *", "Date(MM/DD/YYYY) *", "Start Time(HH:MM AM/PM) *", "End Time(HH:MM AM/PM) *", "Room Name *", "Participant emails(multiple emails separated by ||) *", "Topic"]
   (1..no_of_activities).each do |i|
     date = (Date.parse(start_date)..Date.parse(end_date)).to_a.sample(1)[0].strftime("%m/%d/%Y")
     start_time =(("01".."11").flat_map { |x| x }).sample(1)[0]+":"+["00","30"].sample(1)[0]+ " " + ["AM","PM"].sample(1)[0]
		 end_time = (Time.parse(start_time) + (60*duration)).strftime("%I:%M %p").to_s
     csv << [meeting_type, date, start_time, end_time, room_list[i-1], internal_attendees_array[i-1], ""]
   end
 end
