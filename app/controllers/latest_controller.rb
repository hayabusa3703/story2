class LatestController < ApplicationController
  def index
    @story = Story.new
    @storys = Story.all.page(params[:page]).per(12).reverse
    @categorys = Category.all
  end
end
