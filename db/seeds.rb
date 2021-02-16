30.times do |n|
   User.create!(
     email: "test#{n + 1}@test.com",
     password: "password",
     name: "テストユーザー#{n + 1}",
     birthday: "1956-10-25",
     gender: "1",
     remarks: "こんにちは"
   )
 end
