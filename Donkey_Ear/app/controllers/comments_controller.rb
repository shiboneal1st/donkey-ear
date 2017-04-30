class CommentsController < ApplicationController
  def create
      @comment = Comment.new(comment_params) do |comment|
        comment.user = current_user
        tweet = Tweet.find(params[:tweet_id])
        comment.tweet = tweet
      end
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end