require 'faker'
require 'csv'
require 'facets/date'
require 'date'

csv_filename  = 'ss_activity_upload' + Time.now.to_i.to_s + '.csv'
no_of_activities = 250
internal_attendees_file_name = 'users_internal_domo_domostaff_qa_26_sep_2017.csv'
room_file_name = 'room_upload1506406514.csv'

internal_attendees_array = CSV.table(internal_attendees_file_name)[:email_]
room_list = CSV.table(room_file_name)[:location_name_]
start_date = '2017-09-25'
end_date = '2017-10-05'
duration = 30
workgroups = ["registration", "domo doctor", "attendee support"]

 CSV.open(csv_filename, "wb") do |csv|
   csv << ["Activity Name *", "Date(MM/DD/YYYY) *", "Start Time(HH:MM AM/PM) *", "End Time(HH:MM AM/PM) *", "Location Name *", "Leave Blank", "Participant emails(multiple emails separated by ||)", "Comments", "work group *"]
   (1..no_of_activities).each do |i|
     date = (Date.parse(start_date)..Date.parse(end_date)).to_a.sample(1)[0].strftime("%m/%d/%Y")
     start_time =(("01".."11").flat_map { |x| x }).sample(1)[0]+":"+["00","30"].sample(1)[0]+ " " + ["AM","PM"].sample(1)[0]
		 end_time = (Time.parse(start_time) + (60*duration)).strftime("%I:%M %p").to_s
     attendees = internal_attendees_array.sample(4)
     internal_attendees = attendees[0] + " || " + attendees[1] + " || " + attendees[2] + " || " + attendees[3]
     csv << [Faker::Company.catch_phrase, date, start_time, end_time, room_list.sample(1)[0], "", internal_attendees, "Comment", workgroups.sample(1)[0]]
   end
 end
