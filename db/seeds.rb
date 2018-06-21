require "csv"

categories_view_csv = CSV.readlines("db/categories_view.csv")
categories_view_csv.shift
categories_view_csv.each do |row|
  Category.create(image: row[1], created_at: row[2], updated_at: row[3], name: row[4], color: row[5])
  # idを除くカラム名を記述する
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
