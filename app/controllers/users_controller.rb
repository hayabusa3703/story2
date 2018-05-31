class UsersController < ApplicationController

PROFILESTORYS = 6

  def index
    @categorys = Category.all
    @storys = Story.page(params[:page]).per(PROFILESTORYS).by_created_at
  end

  def edit
    @categorys = Category.all
  end

  def show
    @name = current_user.nickname
    @categorys = Category.all
    @storys = Story.page(params[:page]).per(PROFILESTORYS).by_created_at
  end


end
