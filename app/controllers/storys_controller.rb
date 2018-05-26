class StorysController < ApplicationController

  before_action :move_to_index, except: :index
  before_action :set_story, only: [:show, :edit]
  before_action :set_category, only: [:index, :new, :create, :show]
  before_action :story_find, only: [:destroy, :edit, :update]
  CURRENTSTORYS = 1

  def index
    @storys = Story.all.page(params[:page]).per(CURRENTSTORYS).order('created_at DESC')
  end


  def show
    @comments = @story.comments.includes(:user)
    @comment = Comment.new
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
    @story.update(story_params)
  end

  private
  def set_category
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

  def set_story
    @story = Story.find(params[:id])
  end
end
