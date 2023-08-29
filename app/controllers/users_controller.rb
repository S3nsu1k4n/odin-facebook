class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # profile information, photo and posts
    @user = param_user_id ? User.find(param_user_id) : current_user
  end

  def index
    # list all users and buttons for sending friend requests
    @users = User.all
  end

  private

  def param_user_id
    params.permit(:id)[:id]
  end
end
