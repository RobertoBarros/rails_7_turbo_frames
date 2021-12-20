50.times do |n|
  User.create! name: Faker::Name.name, email: Faker::Internet.email
end
puts '50 users created'