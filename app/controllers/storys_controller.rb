class StorysController < ApplicationController
  before_action :set_story, only: [:show, :edit]
  before_action :move_to_index, except: [:index]

  def index
    @storys = Story.all.page(params[:page]).per(1).order('created_at DESC')
  end

   def show
    @comments = @story.comments.includes(:user)
    @comment = Comment.new
  end

  def new
  end

  def create
    @story = Story.new(story_params)
    @story.save
  end

  def destroy
    story = Story.find(params[:id])
    story.destroy
  end

  def update
    @story = Story.find_by(id: params[:id])
    @story.title = params[:title]
    @story.text = params[:text]
    @story.save
    redirect_to("/storys")
  end

  def edit
  end

  private
  def story_params
    params.permit(:title, :category_id, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_story
    @story = Story.find(params[:id])
  end
end
