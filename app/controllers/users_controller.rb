class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # profile information, photo and posts
    @user = param_user_id ? User.find(param_user_id) : current_user
    @gravatar_url = gravatar_url @user.email
  end

  def index
    # list all users and buttons for sending friend requests
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(edit_params)
      redirect_to user_path, notice: 'Updated information'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def param_user_id
    params.permit(:id)[:id]
  end

  def edit_params
    params.require(:user).permit(:name, :email, :birthday, :city, :employment, :education)
  end

  def gravatar_url(email)
    "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest email.downcase}"
  end
end
