require 'faker'
require 'CSV'

csv_filename  = 'external_users_upload' + Time.now.to_i.to_s + '.csv'
user_number = 400
email_domain = "jifflehq.com"

CSV.open(csv_filename, "wb") do |csv|
  csv << ["Email *", "First Name *", "Last Name *",	"Title *", "Company *", "Phone"]
  (1..user_number).each do |i|
    fn = Faker::Name.first_name
    ln = Faker::Name.last_name
    email = fn + "." + ln + (1..100).to_a.sample.to_s + "@" + email_domain
    csv << [email, fn, ln, Faker::Name.title, Faker::Company.name, Faker::Number.number(10)]
  end
end
