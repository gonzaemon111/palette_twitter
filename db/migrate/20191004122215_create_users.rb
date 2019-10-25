class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true, comment: "Eメールアドレス"
      t.string :password_digest, null: false, limit: 255, comment: "パスワード"
      t.string :nickname, index: true, null: false, default: "", comment: "ニックネーム"
      t.string :token, null: false, comment: "トークン"

      t.timestamps
    end

    add_index :users, %i[email password_digest], name: "complex_unique_uid"
  end
end
