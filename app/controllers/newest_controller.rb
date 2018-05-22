class NewestController < ApplicationController

  def index
    @categorys = Category.all
    @category = Category.find(params[:category_id])
    @storys = Story.all.order("id DESC").page(params[:page]).per(4)
  end
end
