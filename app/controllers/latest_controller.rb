class LatestController < ApplicationController
  LATESTSTORYS = 12

  def index
    @user = User.find(current_user.id)
    @categorys = Category.all
    @storys = Story.all.page(params[:page]).per(LATESTSTORYS).order('created_at DESC')
  end
end
