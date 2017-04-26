class UserhomeController < ApplicationController
	before_action :authenticate_user!
	def index
      @following_users_ids = current_user.following_ids
    	@tweets = Tweet.where("user_id = ? OR user_id in (?)", current_user, @following_users_ids).order('created_at DESC')
  	end
end