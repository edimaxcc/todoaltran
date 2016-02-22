# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Todo.create!( description: 'pickles, eggs, red onion')
#Todo.create!( description: 'pickles, eggs, red onion')
#Todo.create!( description: 'Register Kira for Ruby Junior High and Caleb for Rails High School')
#Todo.create!( description: 'The check engine light is on in the Tacoma')
#Todo.create!( description: 'Take Pinky and Redford to the groomers on Wednesday the 23rd')


# Users
User.create!(username:  "Example User",
             email: "example-#{rand(100000)}@edseed.stoned",
             password:              "foobar12",
             password_confirmation: "foobar12")
# Admin
User.create!(username:  "Altran",
             email: "Altran@test.com",
             password:              "foobar12",
             password_confirmation: "foobar12",
             admin: true)




             

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username: name,
              email: email,
              password:              password,
              password_confirmation: password)
              
end

# TO DO
users = User.order(:created_at).take(6)
10.times do
  #title = Faker::Lorem.sentence(5)
  description = Faker::Lorem.sentence(20)
  done = 0
  users.each { |user| user.todos.create!(description: description, done: done) }
end
