# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Purchaser.create(id: -1, name: "Sakura")
Product.create(name: "iMac Pro", purchase_timestamp: "2019-11-29", purchaser_id: -1)
Product.create(name: "iPhone X", purchase_timestamp: "2019-10-01", purchaser_id: -1)
Product.create(name: "iPhone XS", purchase_timestamp: "2019-09-10", purchaser_id: -1)
Product.create(name: "iPhone 11", purchase_timestamp: "2019-09-10", purchaser_id: -1)
Product.create(name: "Macbook Pro", purchase_timestamp: "2019-08-15", purchaser_id: -1)
Product.create(name: "Macbook")
Product.create(name: "Apple Card")
Product.create(name: "Apple Music")
Product.create(name: "Apple TV")
Product.create(name: "Macbook Air")