class CategorysController < ApplicationController

  def index
    @categorys = Category.all
    @category = Category.find(params[:format])
    @storys = Story.where(category_id: params[:format])
  end

 private
  def story_params
    params.permit(:title, :category_id, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
