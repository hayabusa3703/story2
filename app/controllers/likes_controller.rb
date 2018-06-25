class LikesController < ApplicationController
  before_action :set_variables


  def create
    like = current_user.likes.create(story_id: @story.id)
  end

  def destroy
    like = Like.where(story_id: @story.id, user_id: current_user.id)
    like.destroy(like.ids)
  end

  private

  def set_variables
    if params[:format]
      @story = Story.find(params[:format])
    else
      @story = Story.find(params[:id])
    end
    @id_name = "#like-link-#{@story.id}"
  end

end