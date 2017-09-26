require 'faker'
require 'CSV'

csv_filename  = 'room_upload' + Time.now.to_i.to_s + '.csv'
user_number = 200

CSV.open(csv_filename, "wb") do |csv|
  csv << ["Location Name *", "Location for ICS", "Phone", "Description", "Active - By Default true", "work group (comma separated)"]
  (1..user_number).each do |i|
    room_name = Faker::Address.street_address
    csv << [room_name, "", "", "", "", "registration, domo doctor, attendee support"]
  end
end
