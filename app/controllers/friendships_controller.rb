class FriendshipsController < ApplicationController
  def index
  end
  def create
    @user = User.find(friendship_params[:friend_id])

    if current_user.friends.include?(@user) || current_user == @user
      flash[:notify] = "Already friends with #{@user.name}"
      @users = User.all
    else
      Friendship.create(user_id: current_user.id, friend_id: friendship_params[:friend_id])
      @users = User.all
    end
    redirect_to users_path
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship2 = Friendship.find_by(user_id: @friendship.friend_id, friend_id: current_user.id)
    @friendship.delete
    @friendship2.delete unless @friendship2.nil?

    flash[:success] = "#{User.find(@friendship.friend_id).name} is not a friend anymore"
    redirect_to users_path, status: :see_other
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
