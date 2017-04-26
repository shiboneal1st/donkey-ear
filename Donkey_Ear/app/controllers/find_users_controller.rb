class FindUsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.where("name = ?", params[:search_name])
  end
end