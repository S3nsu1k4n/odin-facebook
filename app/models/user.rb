class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :likes, dependent: :destroy

  def pending_friend_requests
    friends.reject { |friend| friend.friends.include? self }
  end

  def active_friends
    friends.select { |friend| friend.friends.include? self }
  end

  def requests_to_accept
    Friendship.where(friend_id: id).map { |friendship| User.find(friendship.user_id) }.reject { |user| active_friends.include? user }
  end
end
