require "csv"

categories_view_csv = CSV.readlines("db/categories_view.csv")
categories_view_csv.shift
categories_view_csv.each do |row|
  Category.create(image: row[1], created_at: row[2], updated_at: row[3], name: row[4], color: row[5])
  # idを除くカラム名を記述する
end
users_view_csv = CSV.readlines("db/users_view.csv")
users_view_csv.shift
users_view_csv.each do |row|
  User.create(email: row[1], encrypted_pass: row[2], reser_password_token: row[3], sign_in_count: row[4], current_sign_in_at: row[5], last_sign_in_at: row[6], current_sign_in_ip: row[7], last_sign_in_ip: row[8], created_at: row[9], updated_at: row[10], name: row[11])
end
comments_view_csv = CSV.readlines("db/comments_view.csv")
comments_view_csv.shift
comments_view_csv.each do |row|
  Comment.create(text: row[1], story_id: row[2], user_id: row[3], created_at: row[4], updated_at: row[5])
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = ["恋愛","結婚","勉強","仕事","新生活","旅行","病気","日常生活"]
i = 0
8.times do
  Category.create(image: nil, name: a[i])
  i += 1
end
