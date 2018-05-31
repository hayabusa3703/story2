class UsersController < ApplicationController

PROFILESTORYS = 6

  def show
    @categorys = Category.all
    @story = Story.new
    @storys = Story.page(params[:page]).per(PROFILESTORYS).by_created_at
  end

  def edit
  end

  def update
  end

end
