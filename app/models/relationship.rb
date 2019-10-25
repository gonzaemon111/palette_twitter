class Relationship < ApplicationRecord
  belongs_to :user, required: true, class_name: 'User'
  belongs_to :follow, required: true, class_name: 'User'

  validates :user_id, presence: true
  validates :follow_id, presence: true
end
