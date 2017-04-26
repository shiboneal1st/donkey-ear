class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @followee = User.find(params[:followee_id])
    @relationship = Relationship.create(user: @followee, follower: current_user)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @followee = User.find(@relationship.user_id)
    @relationship.destroy
    respond_to do |format|
      format.js
    end
  end
end