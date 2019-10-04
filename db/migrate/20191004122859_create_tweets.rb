class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.references :users, index: true, null: false, comment: "ユーザーID"
      t.string :content, index: true, null: false, default: "", comment: "内容"

      t.timestamps
    end
  end
end
