class TweetsController < ApplicationController
	before_action :authenticate_user!
	def create
		@tweet = Tweet.new(tweet_params) do |tweet|
			tweet.user = current_user
		end

    respond_to do |format|
	    format.js
	  end
	end


  private
  def tweet_params
    params.require(:tweet).permit(:content, :isAnonymous)
  end
end