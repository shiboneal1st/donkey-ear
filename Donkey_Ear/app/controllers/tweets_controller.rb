class TweetsController < ApplicationController
  include UsersHelper
	before_action :authenticate_user!
	def create
		@tweet = Tweet.new(tweet_params) do |tweet|
			tweet.user = current_user
      
      if tweet.isAnonymous
        @anonymous_profile = tweet.user.anonymous_profile
        unless @anonymous_profile
          anonymous_name = get_anonymous_name(current_user.id)
          anonymous_picture_url = get_anonymous_picture_url(current_user.id)
          @anonymous_profile = AnonymousProfile.create({:user => current_user, :name => anonymous_name, :picture => anonymous_picture_url})
        end
      end

		end
    respond_to do |format|
	    format.js
	  end
	end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet_id = params[:id]
    respond_to do |format|
      format.js
    end
  end


  private
  def tweet_params
    params.require(:tweet).permit(:content, :isAnonymous)
  end
end