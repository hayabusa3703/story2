class HomeController < ApplicationController

PROFILESTORYS = 6

  def index
    @categorys = Category.all
    @story = Story.new
    @storys = Story.page(params[:page]).per(PROFILESTORYS).by_created_at
  end
end

