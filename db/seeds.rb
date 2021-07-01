# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'every_day_milecrapes@gmail.com',
   password: 'dmm2021',
)

Genre.create!(
   name: "ケーキ"
)

Product.create!(
   id: 1,
   genre_id: 1,
   image_id: nil,
   name: "ミルクレープ",
   introduction: "あすかちゃんの手作りミルクレープ",
   non_tax_price: 1000,
)

Product.create!(
   id: 2,
   genre_id: 1,
   image_id: nil,
   name: "ショートケーキ",
   introduction: "とちおとめのショートケーキ",
   non_tax_price: 800,
)

   Customer.create!(
   id: 1,
   email: "natsu.coco3108@gmail.com",
   password: "natsu1995",
   created_at: "2021-06-24 09:11:52",
   updated_at: "2021-06-24 09:12:10",
   last_name: "瀧井",
   first_name: "夏",
   first_name_kana: "ナツ",
   last_name_kana: "タキイ",
   postcode: "2760045",
   address: "千葉県八千代市大和田",
   phone_number: "09058453165",
   is_deleted: false,
)

Order.create!(
   id: 1,
   customer_id: 1,
   name: "瀧井夏",
   postcode: 2760045,
   address: "千葉県八千代市大和田",
   postage: 800,
   total_amount: 2200,
   payment_method: 0,
   status: 0,
)

OrderProduct.create!(
   id: 1,
   amount: 2,
   status: 0,
   tax_price: 1100,
   order_id: 1,
   product_id: 1,
   )

OrderProduct.create!(
   id: 2,
   amount: 1,
   status: 0,
   tax_price: 800,
   order_id: 1,
   product_id: 2,
   )