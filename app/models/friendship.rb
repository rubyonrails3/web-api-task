class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_associated :friend
  validates :friend, presence: true
  validates :friend_id, uniqueness: { scope: :user_id, message: 'already friend' }

  after_create :create_reverse_friendship
  after_destroy :destroy_reverse_friendship

  def create_reverse_friendship
    friend.friendships.find_or_create_by(friend_id: user.id)
  end

  def destroy_reverse_friendship
    if friendship = friend.friendships.find_by(friend_id: user.id)
      friendship.destroy
    end
  end
end
