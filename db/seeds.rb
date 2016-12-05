# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Contact.destroy_all
ContactShare.destroy_all

p 'Generating users...'
users = []

10.times do
  users << User.create!(username: Faker::Internet.user_name)
end

p 'Generating contacts...'

contacts = []

users.each do |user|
  contacts << Contact.create!(name: Faker::Name.name, email: Faker::Internet.email, user_id: user.id)
end

p 'Generating shares...'

20.times do
  ContactShare.create(contact_id: contacts.sample.id, user_id: users.sample.id)
end
