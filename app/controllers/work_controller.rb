class WorkController < ApplicationController
  def index
    @storys = Story.all.page(params[:page]).per(4)
    @categorys = Category.all
  end
end
