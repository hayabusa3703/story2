class StorysController < ApplicationController

  before_action :move_to_index, except: :index
  before_action :set_story, only: [:index, :new, :create]
  before_action :story_find, only: [:desroy, :update, :edit]
  RANDOMSTORYS = 4

  def index
    @storys = Story.all.page(params[:page]).per(RANDOMSTORYS)
  end

  def new
    @story = Story.new
  end

  def create
    Story.create(story_params)
  end

  def destroy
    story.destroy
  end

  def update
    story.update(story_params)
  end

  private
  def set_story
    @categorys = Category.all
  end

  def story_find
    story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :category_id, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
