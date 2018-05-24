class CommentsController < ApplicationController

  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.build(comment_params)
    if @comment.save
      redirect_to story_path(params[:story_id])
    else
      render :index
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
