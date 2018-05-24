class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  TOPSTORYS = 4
  def index
    @story = Story.new
    @storys = Story.all.page(params[:page]).per(TOPSTORYS).order('created_at DESC')
    @categorys = Category.all
  end
end
