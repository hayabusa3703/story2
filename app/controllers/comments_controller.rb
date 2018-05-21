class CommentsController < ApplicationController
  def create
    Comment.create(text: comment_params[:text], story_id: comment_params[:story_id], user_id: current_user.id)
  end

  private
  def comment_params
    params.permit(:text, :story_id)
  end
end
