# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Clearing database from Users and Gift requests"
GiftRequest.destroy_all
User.destroy_all

puts "---Creating Default Users..."
hannah = User.create(first_name: "Hannah", last_name: "Eichelsdoerfer", email: 'hannah@localshopper.com', password: '123456', profile_picture: "https://avatars.githubusercontent.com/u/64103699?v=4")
mais = User.create(first_name: "Mais", last_name: "Aroq", email: 'mais@localshopper.com', password: '123456', profile_picture: "https://avatars.githubusercontent.com/u/71976918?v=4")
emily = User.create(first_name: "Emily", last_name: "Hoult",email: 'emily@localshopper.com', password: '123456', profile_picture: "https://avatars.githubusercontent.com/u/75494690?v=4")
vojtech = User.create(first_name: "Vojtech", last_name: "Matous", email: 'vojtech@localshopper.com', password: '123456', profile_picture: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617994666/v7vhpsuijh9nokmdiwqn.jpg")
puts "---Done creating users!"

puts "---Creating Default Products..."
GiftRequest.create(
  recipient_name: "Sophie", 
  recipient_address: "Amsterdam", 
  budget: 100,
  products: "Lush Cloud Bathbomb",
  packaging: "gold",
  requester: hannah
)
GiftRequest.create(
  recipient_name: "Emilia", 
  recipient_address: "Copenhagen",
  budget: 50,
  packaging: "box",
  products: "Lush Cloud Bathbomb", 
  requester: hannah
)
GiftRequest.create(
  recipient_name: "Mia", 
  recipient_address: "Brussels", 
  budget: 200,
  packaging: "brown eco paper",
  products: ["Lush Cloud Bathbomb", "Vegan Chocolate"], 
  requester: hannah
)
GiftRequest.create(
  recipient_name: "Mia", 
  recipient_address: "Brussels", 
  budget: 200,
  packaging: "brown eco paper",
  products: ["Lush Cloud Bathbomb", "Vegan Chocolate"], 
  requester: mais
)
GiftRequest.create(
  recipient_name: "Mia", 
  recipient_address: "Brussels", 
  budget: 200,
  packaging: "brown eco paper",
  products: ["Lush Cloud Bathbomb", "Vegan Chocolate"], 
  requester: mais
)
GiftRequest.create(
  recipient_name: "Mia", 
  recipient_address: "Brussels", 
  budget: 200,
  packaging: "brown eco paper",
  products: ["Lush Cloud Bathbomb", "Vegan Chocolate"], 
  requester: mais
)
GiftRequest.create(
  recipient_name: "Mia", 
  recipient_address: "Brussels", 
  budget: 200,
  packaging: "brown eco paper",
  products: ["Lush Cloud Bathbomb", "Vegan Chocolate"], 
  requester: emily
)
GiftRequest.create(
  recipient_name: "Mia", 
  recipient_address: "Brussels", 
  budget: 200,
  packaging: "brown eco paper",
  products: ["Lush Cloud Bathbomb", "Vegan Chocolate"], 
  requester: emily
)
GiftRequest.create(
  recipient_name: "Mia", 
  recipient_address: "Brussels", 
  budget: 200,
  packaging: "brown eco paper",
  products: ["Lush Cloud Bathbomb", "Vegan Chocolate"], 
  requester: vojtech
)
GiftRequest.create(
  recipient_name: "Mia", 
  recipient_address: "Brussels", 
  budget: 200,
  packaging: "brown eco paper",
  products: ["Lush Cloud Bathbomb", "Vegan Chocolate"], 
  requester: vojtech
)
puts "---Done creating Products!"
