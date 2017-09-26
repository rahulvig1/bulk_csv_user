require 'faker'
require 'csv'

csv_filename  = 'room_upload' + Time.now.to_i.to_s + '.csv'
number_of_rooms = 200

CSV.open(csv_filename, "wb") do |csv|
  csv << ["Name *",	"Capacity *", "Location",	"Contact No",	"Description", "Meeting Types", "Active - By Default true"]
  (1..number_of_rooms).each do |i|
    room_name = Faker::Address.street_address
    csv << [room_name, 20, "", "", "", "", ""]
  end
end
