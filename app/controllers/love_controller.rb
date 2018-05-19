class LoveController < ApplicationController

  def index
    # if params[:category_id] == 4
    #   @category = Category.find(params[:category_id]).where(category_id: 4)
    #   @storys = Story.all.page(params[:page]).per(12).order('created_at DESC')

    # end

    @categorys = Category.all

    # @story = Story.new
    # @storys = Story.all.page(params[:page]).per(12).reverse
  end

 private
  def story_params
    params.permit(:title, :category_id, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
