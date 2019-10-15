class Tweet < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user, required: true, class_name: 'User'
  has_many :tweets, dependent: :destroy, class_name: 'Tweet'
  validates :content, presence: true
  validates :user_id, presence: true
end
