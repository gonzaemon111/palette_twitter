class User < ApplicationRecord
  has_many :tweets, dependent: :destroy, class_name: 'Tweet'
  has_many :relationships, class_name: 'Relationship'
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_secure_password # bcrypt
  validates :password_digest, presence: true, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: { scope: %i[password_digest] }, format: { with: Constants::VALID_EMAIL_REGEX }
  validates :nickname, presence: true
  after_create :self_relationship_create

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def self_relationship_create
    Relationship.create!(user_id: self.id, follow_id: self.id)
  end
end
