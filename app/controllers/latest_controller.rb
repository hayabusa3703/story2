class LatestController < ApplicationController
  LATESTSTORYS = 12

  def index
    @story = Story.new
    @storys = Story.all.page(params[:page]).per(LATESTSTORYS).order('created_at DESC')
    @categorys = Category.all
  end
end
