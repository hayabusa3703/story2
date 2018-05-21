class StorysController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @storys = Story.all.page(params[:page]).per(1).order('created_at DESC')
  end

   def show
    @story = Story.find(params[:id])
    @comments = @story.comments.includes(:user)
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
