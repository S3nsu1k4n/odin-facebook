class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # profile information, photo and posts
    @user = current_user
  end

  def index
    # list all users and buttons for sending friend requests
    @users = User.all
  end
end
