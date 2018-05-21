class CommentsController < ApplicationController
  def create
    Comment.create(text: params[:text], story_id: params[:story_id], user_id: current_user.id)
  end
end
