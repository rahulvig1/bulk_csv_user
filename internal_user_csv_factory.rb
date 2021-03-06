require 'faker'
require 'CSV'

csv_filename  = 'internal_users_upload' + Time.now.to_i.to_s + '.csv'
user_number = 1000
email_domain = "jifflenow.net"

CSV.open(csv_filename, "wb") do |csv|
  csv << ["Email *", "First Name *", "Last Name *", "Title *", "Company *", "Phone *", "Secondary Email id (add email ids with || separation)", "Company Role * (Attendee | Requestor | Executive Admin | Meeting Manager)","Confirm that you have obtained consent to use their personal information for scheduling meetings in Jifflenow. (Y)", "Consent obtained in the form of (email/phone/verbal/contract/others)  ( if others, please specify)", "Verification email already sent before? (view only field, no action)", "Send verification email (Resend if already sent before. If left blank, defaults to N.)"]
  (1..user_number).each do |i|
    fn = Faker::Name.first_name
    ln = Faker::Name.last_name
    email = fn + "." + ln + (1..100).to_a.sample.to_s + "@" + email_domain
    role_name = ["Attendee", "Executive Admin", "Meeting Manager", "Requestor"].sample
    csv << [email, fn, ln, Faker::Name.title, Faker::Company.name, Faker::Number.number(10), "" , role_name, "", "", "", ""]
  end
end
