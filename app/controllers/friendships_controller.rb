class FriendshipsController < ApplicationController
  def create
    @user = User.find(friendship_params[:friend_id])

    if current_user.friends.include?(@user) || current_user == @user
      flash.now[:notify] = "Already friends with #{@user.name}"
      @users = User.all
    else
      Friendship.create(user_id: current_user.id, friend_id: friendship_params[:friend_id])
      @users = User.all
    end
    render 'users/index'
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
