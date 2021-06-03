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
hannah = User.create(location: "Vienna", first_name: "Hannah", last_name: "Eichelsdoerfer", email: 'hannah@localshopper.com', password: '123456', profile_picture: "https://avatars.githubusercontent.com/u/64103699?v=4")
mais = User.create(location: "Tel Aviv", first_name: "Mais", last_name: "Aroq", email: 'mais@localshopper.com', password: '123456', profile_picture: "https://avatars.githubusercontent.com/u/71976918?v=4")
emily = User.create(location: "London", first_name: "Emily", last_name: "Hoult",email: 'emily@localshopper.com', password: '123456', profile_picture: "https://avatars.githubusercontent.com/u/75494690?v=4")
vojtech = User.create(location: "Prague", first_name: "Vojtech", last_name: "Matous", email: 'vojtech@localshopper.com', password: '123456', profile_picture: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617994666/v7vhpsuijh9nokmdiwqn.jpg")
puts "---Done creating users!"

puts "---Creating Default Products..."
GiftRequest.create(
  recipient_name: "Sophie", 
  recipient_address: "London", 
  budget: 100,
  products: ["Lush Cloud Bathbomb"],
  packaging: "gold",
  requester: hannah
)
GiftRequest.create(
  recipient_name: "Emilia", 
  recipient_address: "Tel Aviv",
  budget: 50,
  packaging: "box",
  products: ["Local Spa Voucher"],
  status: "accepted",
  requester: hannah,
  shopper: mais
)
GiftRequest.create(
  recipient_name: "Mia", 
  recipient_address: "Brussels", 
  budget: 200,
  packaging: "gift basket",
  products: ["A tiny cactus", "Chocolate", "Cactus pot"], 
  requester: hannah
)
GiftRequest.create(
  recipient_name: "Sarah", 
  recipient_address: "Prague", 
  budget: 200,
  packaging: "gold wrapping paper",
  products: ["Friends 10 Season Pack"], 
  status: "paid",
  requester: mais,
  shopper: vojtech
)
GiftRequest.create(
  recipient_name: "Claire", 
  recipient_address: "Dresden", 
  budget: 200,
  packaging: "brown eco paper",
  products: ["Lush Cloud Bathbomb", "Vegan Chocolate"], 
  requester: mais
)
GiftRequest.create(
  recipient_name: "Chloe", 
  recipient_address: "Madrid", 
  budget: 200,
  products: ["Bodyshop Creme", "Lindt Chocolate"], 
  requester: mais
)
GiftRequest.create(
  recipient_name: "Elena", 
  recipient_address: "Brussels", 
  budget: 200,
  products: ["Prada Bag", "FFP2 Prada Mask"], 
  requester: emily
)
GiftRequest.create(
  recipient_name: "Annie", 
  recipient_address: "Vienna", 
  budget: 200,
  packaging: "gift bag",
  products: ["Jojo Moyes Book", "A mug"], 
  status: "delivered",
  requester: emily,
  shopper: hannah
)
GiftRequest.create(
  recipient_name: "Fifi", 
  recipient_address: "London", 
  budget: 20,
  packaging: "yellow bow around",
  status: "purchased",
  products: ["A wallet", "Picture Frame", "A handcreme"], 
  requester: vojtech,
  shopper: emily
)
GiftRequest.create(
  recipient_name: "Coleen", 
  recipient_address: "Tel Aviv", 
  budget: 60,
  packaging: "colorful box",
  products: ["Earrings", "Vegan Chocolate"], 
  status: "delivered",
  requester: vojtech,
  shopper: mais
)

GiftRequest.create(
  recipient_name: "Coleen", 
  recipient_address: "London", 
  budget: 60,
  packaging: "colorful box",
  products: ["Sleeping Bag", "20l Backpack"], 
  requester: vojtech,
)
puts "---Done creating Products!"
