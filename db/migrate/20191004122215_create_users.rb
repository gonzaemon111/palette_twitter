class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, comment: "Eメールアドレス"
      t.string :password_digest, null: false, limit: 255, comment: "パスワード"
      t.string :nickname, index: true, null: false, default: "", comment: "ニックネーム"

      t.timestamps
    end

    add_index :users, %i[email password_digest], name: "complex_unique_uid", unique: true
  end
end
