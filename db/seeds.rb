# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
p 'Clean DB'

Restaurant.destroy_all

p 'populating DB'
CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
50.times do
  res = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: CATEGORIES.sample
  )
  review = Review.create(
    content: Faker::Restaurant.review,
    rating: rand(0..5),
    restaurant_id: res.id
  )
  p "Restaurant id: #{res.id} was created with review #{review.id}"
end
