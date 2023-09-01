class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(post_params)
    if Like.find_by(user_id: current_user.id, post_id: post_params[:post_id]).nil?
      if @like.save
        redirect_to posts_path, notice: 'Post liked'
      else
        redirect_to current_user, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if Like.find(params[:id]).delete
      redirect_to posts_path, notice: 'Unliked post'
    else
      redirect_to posts_path, status: :unprocessable_entity
    end
  end

  def post_params
    params.require(:post).permit(:post_id)
  end
end
