class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to story_path(params[:story_id])
  end

  private
  def comment_params
    params.permit(:text, :story_id).merge(user_id: current_user.id)
  end
end
