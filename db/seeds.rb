# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
GiftRequest.destroy_all

puts "---Creating Default Users..."
hannah = User.create(email: 'hannah@localshopper.com', password: '123456')
mais = User.create(email: 'mais@localshopper.com', password: '123456')
emily = User.create(email: 'emily@localshopper.com', password: '123456')
vojtech = User.create(email: 'vojtech@localshopper.com', password: '123456')
puts "---Done creating users!"

GiftRequest.create(recipient_name: "Sophie", recipient_address: "Amsterdam", products: ["Veganz White Hazelnut Chocolate", "Lush Cloud Bathbomb"], requester_id: hannah)
