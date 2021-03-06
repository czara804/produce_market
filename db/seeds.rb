# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting all products"
Product.delete_all

3.times do
Product.create(
  name: Faker::Food.fruits,
  description: Faker::Hipster.paragraph(sentence_count: 2),
  quantity: Faker::Number.number(digits: 2),
  price: Faker::Number.between(from: 1, to: 10),
  date_available: Faker::Date.in_date_period,
  delivery_option: 'either'
)
end 