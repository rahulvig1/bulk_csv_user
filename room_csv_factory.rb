require 'faker'
require 'CSV'

csv_filename  = 'room_upload' + Time.now.to_i.to_s + '.csv'
user_number = 200

CSV.open(csv_filename, "wb") do |csv|
  csv << ["Name *",	"Capacity *", "Location",	"Contact No",	"Description", "Meeting Types", "Active - By Default true"]
  (1..user_number).each do |i|
    room_name = Faker::Address.street_address
    csv << [room_name, 20, "", "", "", "", ""]
  end
end
