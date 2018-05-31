class UsersController < ApplicationController

PROFILESTORYS = 6

  def index
    @user = User.find(current_user.id)
    @categorys = Category.all
    @storys = Story.page(params[:page]).per(PROFILESTORYS).by_created_at
  end

  def edit
    @user = User.find(current_user.id)
    @categorys = Category.all
  end

  def show
    @categorys = Category.all
    @storys = Story.page(params[:page]).per(PROFILESTORYS).by_created_at
  end


end
