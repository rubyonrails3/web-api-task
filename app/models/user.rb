class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true
  validates :name, presence: true

  has_many :tweets, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :reverse_friendships, dependent: :destroy, class_name: 'Friendship', foreign_key: :friend_id
  has_many :friends, through: :friendships

	before_create do |user|
    user.api_key = generate_api_key
	end

  def feeds params: {}
    Tweet.where(user_id: friend_ids + [id])
  end

  private

	def generate_api_key
    SecureRandom.base64(24)
	end
end
