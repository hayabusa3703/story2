class LikesController < ApplicationController
  before_action :set_variables

  def like
    like = current_user.likes.new(story_id: @story.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(story_id: @story.id)
    like.destroy
  end

  private

  def set_variables
    @story = Story.find(params[:story_id])
    @id_name = "#like-link-#{@story.id}"
    @id_heart = "#heart-#{@story.id}"
  end

end
























# class LikesController < ApplicationController
#    before_action :like_where, only: [:create, :destroy]

#   def create
#     @like = Like.create(user_id: current_user.id, story_id: params[:story_id])
#     @storys = Story.all
#   end

#   def destroy
#     @like = Like.find_by(user_id: current_user.id, story_id: params[:story_id])
#     @like.destroy
#     @storys = Story.all
#   end

#   private
#   def like_where
#     @likes = Like.where(story_id: params[:story_id])
#   end
# end
