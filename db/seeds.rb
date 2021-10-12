# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
5.times do |index|
  User.create!(
    name: "onikarubi#{index}",
    email: "onikarubi#{index}@gmail.com",
    password: 'onikarubi@gmail.com'
  )
end

User.all.each do |user|
  user.books.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    description: Faker::Lorem.sentence
  )
end
