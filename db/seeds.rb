# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'test@test.com',
    password: '123456',
)

# ジャンルseed
Genre.create!(
  [
    {
      name: 'ケーキ'
    },
    {
      name: '焼き菓子'
    },
    {
      name: 'プリン'
    }
  ]
)

product=Product.create!(
      genre_id: 1,
      name: "ショートケーキ",
      price: 500,
      explanation: "ふわっふわな食感がクセになります。",
      is_active: true
)
product.image.attach(io: File.open(Rails.root.join("app/assets/images/shortcake.jpg")), filename: "shortcake.jpg")

product2 = Product.create!(
  id: 2,
  genre_id: 1,
  name: "チョコケーキ",
  price: 550,
  explanation: "ほろ苦さと甘さのコントラストが楽しめます。",
  is_active: false)
product2.image.attach(io: File.open(Rails.root.join("app/assets/images/chocolatecake.jpg")), filename: "chocolatecake.jpg")

product3 = Product.create!(
      id: 3,
      genre_id: 3,
      name: "プリン６個セット",
      price: 1200,
      explanation: "地元で採れた新鮮な卵をたっプリン使用。なめらかな食感です。",
      is_active: true
)
product3.image.attach(io: File.open(Rails.root.join("app/assets/images/pudding.jpg")), filename: "pudding.jpg")

#Customer.Mdel(3)
Customer.create!(
  [
    {
        last_name: '菅田',
        first_name: '将暉',
        last_kana: 'スダ',
        first_kana: 'マサキ',
        email: 'i@i',
        zip: '3333333',
        address: '東京都渋谷区◯◯',
        phone_number: '3333333333',
        password: 'iiiiii',
    },
    {
        last_name: '石原',
        first_name: 'さとみ',
        last_kana: 'イシハラ',
        first_kana: 'サトミ',
        email: 'u@u',
        zip: '4444444',
        address: '東京都港区△△',
        phone_number: '4444444444',
        password: 'uuuuuu',
    },
    {
        last_name: '横浜',
        first_name: '流星',
        last_kana: 'ヨコハマ',
        first_kana: 'リュウセイ',
        email: 'e@e',
        zip: '5555555',
        address: '東京都港区□□',
        phone_number: '5555555555',
        password: 'eeeeee',
    },
    {
        last_name: 'Waggy',
        first_name: '審司',
        last_kana: 'ワギー',
        first_kana: 'シンジ',
        email: 'test@test',
        zip: '1600023',
        address: '東京都新宿区西新宿３−７−２６−１００６',
        phone_number: '2525252525',
        password: 'mmmmmm',
    },
    {
        last_name: 'カラスの',
        first_name: 'カァ',
        last_kana: 'カラスノ',
        first_kana: 'カァ',
        email: 'kaa@kaa',
        zip: '5555555',
        address: 'でんしんばしら１本目',
        phone_number: '5555555555',
        password: 'kkkkkk',
    }
   ]
)

# 配送先seed
Delivery.create!(
  [
    {
      customer_id: 1,
      name: "入間 埼玉",
      zip: "1234567",
      address: "埼玉県入間市三井アウトレットパーク",
    },
    {
      customer_id: 1,
      name: "秩父 埼玉",
      zip: "1234568",
      address: "埼玉県山崎ウイスキー蒸留所",
    },
    {
      customer_id: 4,
      name: "桜木 男道",
      zip: "1470017",
      address: "東京都都立 武蔵野北高等学校",
    },
    {
      customer_id: 4,
      name: "マツコの部屋",
      zip: "1060046",
      address: "東京都港区元麻布 スーパーデラックスビル 20-22階,玄関は20階",
    },
    {
      customer_id: 4,
      name: "目黒 秋刀魚",
      zip: "1170117",
      address: "不思議の国の絵本の目黒町",
    },
    {
      customer_id: 4,
      name: "三鳥 ウイスキー",
      zip: "6180001",
      address: "大阪府三島郡島本町 山崎ウイスキー蒸留所",
    }
  ]
)

Order.create!(  [{
    id: 1,
  customer_id: 5,
  name: "カラスの カァ",
  zip: '5555555',
  address: 'でんしんばしら１本目',
  total_price: 3716,
  postage: 800,
  payment_method: "credit_card",
  status: "wait",},
  {
    id: 2,
      customer_id: 4,
      name: "Waggy 審司",
      zip: "1600023",
      address: "東京都新宿区西新宿３−７−２６−１００６",
      total_price: 5012,
      postage: 800,
      payment_method: "credit_card",
      status: "wait",
  }

  ]
  )

 OrderItem.create!(
    [
      {
        id: 1,
        product_id: 3,
        order_id: 1,
        product_count: 1,
        price: 1200,
        production_status: "witing_for_production",
      },
      {  id: 2,
        product_id: 1,
        order_id: 1,
        product_count: 3,
        price: 500,
        production_status: "cannot_start",

      },
      {
        id: 3,
        product_id: 1,
        order_id: 2,
        product_count: 3,
        price: 500,
        production_status: "cannot_start",
      },
      {
        id: 4,
        product_id: 3,
        order_id: 2,
        product_count: 2,
        price: 1200,
        production_status: "cannot_start",
      }
    ]
  )

  product4 = Product.create!(
      id: 4,
      genre_id: 2,
      name: "いちごとベリーのタルト",
      price: 1100,
      explanation: "果実の甘みを活かす生地でふんわり包みました。",
      is_active: true
)
product4.image.attach(io: File.open(Rails.root.join("app/assets/images/tart.jpg")), filename: "tart.jpg")

product5 = Product.create!(
      id: 5,
      genre_id: 1,
      name: "X'mas Special",
      price: 5000,
      explanation: "大切な人と今年はパーティしませんか？？。",
      is_active: true
)
product5.image.attach(io: File.open(Rails.root.join("app/assets/images/x'mas_cake.jpg")), filename: "x'mas_cake.jpg")

