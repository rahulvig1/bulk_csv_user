require 'faker'
require 'CSV'

csv_filename  = 'users_upload.csv'
user_number = 2
email_domain = "jifflenow.net"

CSV.open(csv_filename, "wb") do |csv|
  csv << ["Email *", "First Name *", "Last Name *",	"Title *", "Company *", "Phone *", "Add Multiple Email id's with || Separation.", "Role Name *", "Send Notification(Y/N - default N)"]
  (0..user_number).each do |i|
    fn = Faker::Name.first_name
    ln = Faker::Name.last_name
    email = fn + "." + ln + (1..100).to_a.sample.to_s + "@" + email_domain
    role_name = ["Attendee", "Executive Admin", "Meeting Manager", "Requestor"].sample
    csv << [email, fn, ln, Faker::Name.title, Faker::Company.name, Faker::Number.number(10), "" , role_name, "" ]
  end
end
