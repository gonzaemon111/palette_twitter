# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..3).each do |i|
  User.create!(nickname: "hogehoge#{i}", email: "hoge#{i}@hoge.com", password: "hogehoge", token: Digest::SHA256.hexdigest("hoge#{i}@hoge.com"))
  (1..3).each do |j|
    Tweet.create!(content: "hogehoge#{j}hogehoge#{j}", user_id: i, image: open("#{Rails.root}/public/github.png"))
  end
end