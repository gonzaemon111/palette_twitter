class Tweet < ApplicationRecord
  include ImageUploader[:image]
  after_destroy :retweets_destroy
  belongs_to :user, required: true, class_name: 'User'
  validates :content, presence: true
  validates :user_id, presence: true

  def retweets_destroy
    retweets = Tweet.where(tid: self.id)
    if retweets
      retweets.delete_all
    end
  end
end
