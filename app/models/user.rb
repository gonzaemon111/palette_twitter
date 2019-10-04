class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_secure_password # bcrypt
  validates :password_digest, presence: true, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: { scope: %i[password_digest] }, format: { with: Constants::VALID_EMAIL_REGEX }
  validates :nickname, presence: true
end
