 require 'faker'
 
 50.times do
   Wiki.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end

 # Create standard and premium plans
 Plan.create!(name: "Standard", price: 0.0)
 Plan.create!(name: "Premium", price: 10.0)
  
 puts "Seed finished"
 puts "#{Wiki.count} posts created"

  # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
  # Create a premium member
 premium = User.new(
   name:     'Premium User',
   email:    'premium@example.com',
   password: 'helloworld',
   role:     'premium'
 )
 premium.skip_confirmation!
 premium.save!

 # Create a standard member
 standard = User.new(
   name:     'Standard User',
   email:    'standard@example.com',
   password: 'helloworld',
   role:     'standard'
 )
 standard.skip_confirmation!
 standard.save!