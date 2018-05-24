class LegendController < ApplicationController
  LEGENDSTORYS = 12

  def index
    @story = Story.new
    @storys = Story.all.page(params[:page]).per(LEGENDSTORYS).order('created_at DESC')
    @categorys = Category.all
  end
end
