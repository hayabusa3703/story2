class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to story_path(params[:story_id])
    else
      render :index
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(story_id: params[:story_id])
  end
end
