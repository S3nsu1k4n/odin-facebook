class CommentsController < ApplicationController
  @@post_id_param = 0

  def new
    @comment = Comment.new
    @@post_id_param = comment_post_id_params
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = @@post_id_param[:post_id]
    if @comment.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_post_id_params
    params.require(:comment).permit(:post_id)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
