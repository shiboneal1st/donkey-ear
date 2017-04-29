class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def update
    current_user.update(user_params)
    current_user.save!
    redirect_to root_path
  end

  def show
    @tweets = @user.tweets
  end

  def following
    @following = @user.following
  end

  def followers
    @followers = @user.followed
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :email, :picture)
  end

  def set_user
    @user = User.find(params[:id])
  end
end