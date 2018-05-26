class LikesController < ApplicationController

   before_action :like_where, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, story_id: params[:story_id])
    @storys = Story.all
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, story_id: params[:story_id])
    @like.destroy
    @storys = Story.all
  end

  private
  def like_where
    @likes = Like.where(story_id: params[:story_id])
  end
end
