class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :people_who_liked, through: :likes, source: :user
  has_many :comments

  def liked_by? current_user
    !likes.find_by(user_id: current_user.id).nil?
  end
end
