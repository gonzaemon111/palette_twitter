class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.references :user, foreign_key: true, index: true, null: false, comment: "ユーザーID"
      t.string :content, index: true, null: false, default: "", comment: "内容"
      t.text :image_data, comment: "画像"
      t.integer :tid, index: true, null: false, default: 0, comment: "リツイート ID"

      t.timestamps
    end
    # add_reference :tweets, :tweet, foreign_key: true, null: false, index: true, comment: "リツイート ID"
  end
end
