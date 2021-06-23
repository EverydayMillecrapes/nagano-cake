# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'every.day_milecrapes@gmail.com',
   password: 'dmm2021',
)

Genre.create!(
   name: "ケーキ"
)

Product.create!(
   genre_id: 1,
   image_id: nil,
   name: "ミルクレープ",
   introduction: "あすかちゃんの手作りミルクレープ",
   non_tax_price: 1000,
)