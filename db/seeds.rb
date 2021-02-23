30.times do |n|
   User.create!(
     email: "test#{n + 1}@test.com",
     password: "password",
     name: "山田 太郎#{n + 1}",
     birthday: "1956-10-25",
     gender: "1",
     remarks: "こんにちは"
   )
 end


Category.create(category_name:"アウトドア")
Category.create(category_name:"カフェ")
Category.create(category_name:"スポーツ")
Category.create(category_name:"旅")
Category.create(category_name:"カメラ")
Category.create(category_name:"グルメ")
Category.create(category_name:"コーヒー")
Category.create(category_name:"音楽")
Category.create(category_name:"カラオケ")
Category.create(category_name:"映画")
Category.create(category_name:"読書")
Category.create(category_name:"ウォーキング")
Category.create(category_name:"ヨガ")
Category.create(category_name:"料理")
Category.create(category_name:"エンタメ")
Category.create(category_name:"芸術")
