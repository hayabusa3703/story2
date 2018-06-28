class UsersController < ApplicationController

PROFILESTORYS = 6

  def show
  	@categorys = Category.all
    user = User.find(params[:id])
    @nickname = current_user.name
    @storys = Story.where(user_id: current_user.id).page(params[:page]).per(PROFILESTORYS).by_created_at
  end

end