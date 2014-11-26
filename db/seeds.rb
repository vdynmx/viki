 require 'faker'
 
 # Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

 # Create Wikis
 50.times do
   Wiki.create!(
     user:   users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 wikis = Wiki.all
 
 user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'vdynmx@aol.com',
   password: 'helloworld'
 )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} posts created"