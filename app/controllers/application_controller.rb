class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  TOPSTORYS = 4
  def index
    @storys = Story.page(params[:page]).per(TOPSTORYS).by_created_at
    @categorys = Category.all
  end
end
