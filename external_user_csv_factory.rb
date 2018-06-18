require 'faker'
require 'CSV'

csv_filename  = 'external_users_upload' + Time.now.to_i.to_s + '.csv'
user_number = 500
email_domain = "jifflehq.com"

CSV.open(csv_filename, "wb") do |csv|
  csv << ["Email *", "First Name *", "Last Name *",	"Title *", "Company *", "Phone", "Confirm that you have obtained consent to use their personal information for scheduling meetings in Jifflenow. (Y)", "Consent obtained in the form of (email/phone/verbal/contract/others)  ( if others, please specify)"]
  (1..user_number).each do |i|
    fn = Faker::Name.first_name
    ln = Faker::Name.last_name
    email = fn + "." + ln + (1..100).to_a.sample.to_s + "@" + email_domain
    csv << [email, fn, ln, Faker::Name.title, Faker::Company.name, Faker::Number.number(10), "", ""]
  end
end
