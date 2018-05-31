class CategorysController < ApplicationController

  before_action :set_category, only: [:index, :show, :newest]
  before_action :set_sort, only: [:index, :show]

  def show
    @user = User.find(current_user.id)
  end

  def newest
    @storys = Story.where(category_id: params[:id]).order("created_at DESC")
  end

  private

    def set_category
      @categorys = Category.all
      @category = Category.find(params[:id])
    end

    def set_sort
      @storys = Story.where(category_id: params[:id])
    end
end
