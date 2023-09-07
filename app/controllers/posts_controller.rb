class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    posts = current_user.posts
    friends_posts = current_user.friends.map { |friend| friend.posts }.flatten
    @all_posts = (posts + friends_posts).sort_by(&:created_at).reverse
  end

  def new
    @post = Post.new
  end

  def create
    if current_user.posts.build(post_params).save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
