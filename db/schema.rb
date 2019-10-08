# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_04_122859) do

  create_table "tweets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.string "content", default: "", null: false, comment: "内容"
    t.text "image_data", comment: "画像"
    t.integer "tid", default: 0, null: false, comment: "ツイート ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content"], name: "index_tweets_on_content"
    t.index ["tid"], name: "index_tweets_on_tid"
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", null: false, comment: "Eメールアドレス"
    t.string "password_digest", null: false, comment: "パスワード"
    t.string "nickname", default: "", null: false, comment: "ニックネーム"
    t.string "token", null: false, comment: "トークン"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email", "password_digest"], name: "complex_unique_uid"
    t.index ["nickname"], name: "index_users_on_nickname"
  end

  add_foreign_key "tweets", "users"
end
