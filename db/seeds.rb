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
   w1 = Wiki.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph     
   )

   w1.users << users.sample
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
puts "#{Wiki.count} wikis created"