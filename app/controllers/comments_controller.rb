class CommentsController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.new(comment_params)
    @comment.save
    redirect_to story_path(params[:story_id])
  end

  private
  def comment_params
    params.permit(:text, :story_id).merge(user_id: current_user.id)
  end
end
