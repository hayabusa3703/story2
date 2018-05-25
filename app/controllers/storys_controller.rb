class StorysController < ApplicationController

  before_action :move_to_index, except: :index
  before_action :set_story, only: [:index, :new, :create]
  before_action :story_find, only: [:destroy, :edit, :update]
  CURRENTSTORYS = 1

  def index
    @storys = Story.all.page(params[:page]).per(CURRENTSTORYS).order('created_at DESC')
  end

  def new
    @story = current_user.stories.build
  end

  def create
    @story = current_user.stories.build(story_params)
    @story.save
  end

  def destroy
    @story.destroy
  end

  def edit
  end

  def update
    @story = Story.update(story_params)
  end

  private
  def set_story
    @categorys = Category.all
  end

  def story_find
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :category_id, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
