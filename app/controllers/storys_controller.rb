class StorysController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    stories__num = 4
    @storys = Story.all.page(params[:page]).per(stories__num)
    @categorys = Category.all
  end

  def new
    @categorys = Category.all
  end

  def create
    Story.create(story_params)
    @categorys = Category.all
  end

  def destroy
    story = Story.find(params[:id])
    story.destroy
  end

  def update
    story = Story.find(params[:id])
    story.update(story_params)
  end

  def edit
    @story = Story.find(params[:id])
  end

  private
  def story_params
    params.permit(:title, :category_id, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
