# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..5).each do |i|
  User.create!(nickname: "hogehoge#{i}", email: "hoge#{i}@hoge.com", password: "hogehoge", token: Digest::SHA256.hexdigest("hoge#{i}@hoge.com"))
  (1..3).each do |j|
    Tweet.create!(content: "hogehoge#{j}hogehoge#{j}", user_id: i)
  end
end

Relationship.create!(user_id: 1, follow_id: 2)
Relationship.create!(user_id: 1, follow_id: 3)
Relationship.create!(user_id: 2, follow_id: 1)
Relationship.create!(user_id: 3, follow_id: 1)
Relationship.create!(user_id: 2, follow_id: 3)
Relationship.create!(user_id: 3, follow_id: 4)
Relationship.create!(user_id: 4, follow_id: 5)