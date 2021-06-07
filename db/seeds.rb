# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "Clearing database from Users and Gift requests"
Message.destroy_all
Chatroom.destroy_all
GiftRequest.destroy_all
Chatroom.destroy_all
User.destroy_all


puts "---Creating seeds"
puts "..."
#puts "---Creating Default Users..."
hannah = User.create(
  location: "Sydney", 
  first_name: "Hannah", 
  last_name: "Eichelsdoerfer", 
  email: 'hannah@localshopper.com', 
  password: '123456', 
  profile_picture: "https://avatars.githubusercontent.com/u/64103699?v=4"
  )
mais = User.create(
  location: "Tel Aviv", 
  first_name: "Mais", 
  last_name: "Aroq", 
  email: 'mais@localshopper.com', 
  password: '123456', 
  profile_picture: "https://avatars.githubusercontent.com/u/71976918?v=4"
  )
emily = User.create(
  location: "Barcelona",
  first_name: "Emily", 
  last_name: "Hoult",
  email: 'emily@localshopper.com', 
  password: '123456', 
  profile_picture: "https://avatars.githubusercontent.com/u/75494690?v=4"
  )
vojtech = User.create(
  location: "Prague",
  first_name: "Vojtech", 
  last_name: "Matous", 
  email: 'vojtech@localshopper.com', 
  password: '123456', 
  profile_picture: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617994666/v7vhpsuijh9nokmdiwqn.jpg"
  )
charles = User.create(
  location: "Brussels",
  first_name: "Charles", 
  last_name: "Overleaux", 
  email: 'charles@localshopper.com', 
  password: '123456', 
  profile_picture: "https://avatars.githubusercontent.com/u/33698505?v=4"
  )
hannes = User.create(
  location: "Berlin",
  first_name: "Hannes", 
  last_name: "Schaletzky", 
  email: 'hannes@localshopper.com', 
  password: '123456', 
  profile_picture: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617610850/mxfccfai3khgtaosnj2n.jpg"
  )
vicenzo = User.create(
  location: "", 
  first_name: "Vincenzo", 
  last_name: "Schaletzky", 
  email: 'vincenzo@localshopper.com', 
  password: '123456', 
  profile_picture: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1621413022/nfqu6jhufrzsmbo5idzz.jpg"
	)
prabha = User.create(
  location: "Berlin", 
  first_name: "Prabha", 
  last_name: "Pothen", 
  email: 'prabha@localshopper.com', 
  password: '123456', 
  profile_picture: "https://avatars.githubusercontent.com/u/43320081?v=4"
  )
jeanie = User.create(
  location: "Frankfurt", 
  first_name: "Jeanie", 
  last_name: "Ahn", 
  email: 'jeanie@localshopper.com', 
  password: '123456', 
  profile_picture: "https://avatars.githubusercontent.com/u/43320081?v=4https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617609512/eabdmwghzmkymo82gatb.jpg"
  )
jeanie = User.create(
  location: "Frankfurt", 
  first_name: "Jeanie", 
  last_name: "Ahn", 
  email: 'jeanie@localshopper.com', 
  password: '123456', 
  profile_picture: "https://avatars.githubusercontent.com/u/43320081?v=4https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617609512/eabdmwghzmkymo82gatb.jpg"
)  
barcelonaShopper = User.create(
  location: "Barcelona", 
  first_name: "Eileen", 
  last_name: "Smith", 
  email: 'eileen@localshopper.com', 
  password: '123456', 
  profile_picture: "https://images.unsplash.com/photo-1502378735452-bc7d86632805?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=aa3a807e1bbdfd4364d1f449eaa96d82"
  )
pragueShopper = User.create(
  location: "Prague", 
  first_name: "Konstantin", 
  last_name: "Müller", 
  email: 'konstantin@localshopper.com', 
  password: '123456', 
  profile_picture: "https://uifaces.co/our-content/donated/L7wQctBt.jpg"
  )
grazShopper = User.create(
  location: "Graz", 
  first_name: "Theresa", 
  last_name: "Steiner", 
  email: 'theresa@localshopper.com', 
  password: '123456', 
  profile_picture: "https://uifaces.co/our-content/donated/N8kxcjRw.jpg"
  )
berlinShopper = User.create(
  location: "Berlin", 
  first_name: "Alicia", 
  last_name: "Müller", 
  email: 'alicia@localshopper.com', 
  password: '123456', 
  profile_picture: "https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
  )

# prices added to the past gift request that have the paid status
# careful, the budget is in euros and the price in eurocents
# Past Gift Requests for Hannah
gift_for_chat_1 = GiftRequest.create(
  recipient_name: "Vojtech",
  recipient_address: "Prague",
  delivery_due_date: "",
  budget: 70,
  price_cents: 6543,
  packaging: "Gift Bag",
  product1: "Local Spa Voucher",
  status: "delivered",
  requester: hannah,
  shopper: pragueShopper
)
# gift_for_chat_2 = GiftRequest.create(
#   recipient_name: "Lisa",
#   recipient_address: "Graz",
#   budget: 200,
#   packaging: "Gift Basket",
#   product1: "A tiny cactus", 
#   product2: "Veganz Almond Chocolate", 
#   product3: "Cactus pot",
#   requester: hannah,
#   status: "paid",
#   shopper: grazShopper
# )

# Shopped Gifts for the Barcelona Shopper (Eileen)
gift_for_chat_3 = GiftRequest.create(
  recipient_name: "Irene",
  recipient_address: "Barcelona",
  budget: 200,
  price_cents: 19999, # careful, the budget is in euros and the price in cents
  packaging: "Gift Bag, unwrapped",
  product1: "A tiny cactus", 
  product2: "Veganz Almond Chocolate", 
  product3: "Cactus pot",
  requester: grazShopper,
  status: "paid",
  shopper: barcelonaShopper
)

Review.create(
  rating: 5,
  review: "My friend said Eileen was super nice when she delivered the gift, everything was perfect!",
  gift_request_id: gift_for_chat_3.id
)

gift_for_chat_4 = GiftRequest.create(
  recipient_name: "Jessica",
  recipient_address: "Barcelona",
  price_cents: 19999,
  budget: 200,
  packaging: "Gift Basket",
  product1: "Craft Beer Mix",
  requester: berlinShopper,
  status: "paid",
  shopper: barcelonaShopper
)

Review.create(
  rating: 4,
  review: "Great communication, fast delivery.",
  gift_request_id: gift_for_chat_4.id
)

# Open Gift Requests in Barcelona


GiftRequest.create(
  recipient_name: "Theresa",
  recipient_address: "Barcelona",
  budget: 200,
  packaging: "gift bag",
  product1: "Jojo Moyes Book", 
  product2: "A handcrafted mug",
  requester: grazShopper,
)

GiftRequest.create(
  recipient_name: "Charlotte",
  recipient_address: "Barcelona",
  budget: 20,
  packaging: "yellow bow around",
  product1: "Wallet",
  product2: "Picture Frame",
  product3: "A handcreme",
  requester: pragueShopper,
)

GiftRequest.create(
  recipient_name: "Emily",
  recipient_address: "Barcelona",
  budget: 20,
  product1: "Friends All 10 Seasons",
  requester: charles
)

GiftRequest.create(
  recipient_name: "Sophie",
  recipient_address: "Barcelona",
  budget: 20,
  product1: "Package with local snacks",
  requester: berlinShopper
)

GiftRequest.create(
  recipient_name: "Emily",
  recipient_address: "Barcelona",
  budget: 30,
  product1: "Mechanical Keyboard",
  product2: "Coder Mug",
  requester: hannes
)


# gift_for_chat_5 = GiftRequest.create(
#   recipient_name: "Coleen",
#   recipient_address: "Tel Aviv",
#   budget: 60,
#   packaging: "colorful box",
#   status: "pending",
#   product1: ["Earrings", "Vegan Chocolate"],
#   status: "delivered",
#   requester: vojtech,
#   shopper: mais
# )


# GiftRequest.create(
#   recipient_name: "Coleen",
#   recipient_address: "London",
#   budget: 60,
#   status: "pending",
#   packaging: "colorful box",
#   product1: ["Sleeping Bag", "20l Backpack"],
#   requester: vojtech,
# )


# GiftRequest.create(
#   recipient_name: "Julian",
#   recipient_address: "Vienna",
#   budget: 60,
#   packaging: "colorful box",
#   requester: emily,
#   product1: ["Parfume", "Instax Mini"],
# )

# GiftRequest.create(
#   recipient_name: "Trent",
#   recipient_address: "Vienna",
#   budget: 60,
#   packaging: "colorful box",
#   product1: ["Sleeping Bag", "Hiking Backpack"],
#   requester: vojtech,
# )

# GiftRequest.create(
#   recipient_name: "Heinz",
#   recipient_address: "Vienna",
#   budget: 60,
#   packaging: "colorful box",
#   product1: ["Hunter Knife", "New Car Tires"],
#   requester: vojtech
# )

# gift_for_chat_6 = GiftRequest.create(
#   recipient_name: "Klaus",
#   recipient_address: "Prague",
#   budget: 60,
#   packaging: "colorful box",
#   product1: "New Car Tires",
#   product2: "Hunter Knife",
#   requester: mais
# )

# GiftRequest.create(
#   recipient_name: "Hannes",
#   recipient_address: "Berlin",
#   budget: 60,
#   packaging: "colorful box",
#   product1: "Vegan Chocolate",
#   requester: charles
# )

Chatroom.create(
  gift_request_id:gift_for_chat_1.id
)

# Chatroom.create(
#   gift_request_id:gift_for_chat_2 .id
# )

Chatroom.create(
 gift_request_id:gift_for_chat_3.id
)

Chatroom.create(
  gift_request_id:gift_for_chat_4.id
)

puts "---Done creating Seeds!"
