# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(email: 'user@example.com',
                    password: 'password',
                    password_confirmation: 'password')

other_user = User.create!(email: 'other_user@example.com',
                          password: 'password',
                          password_confirmation: 'password')

10.times do |i|
  Post.create!(author: user, content: "I wrote something #{'!' * i}")
end
Post.create!(author: other_user, content: 'BATMAN FOREVER2!!!')
