class PostsController < ApplicationController
  def index
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
