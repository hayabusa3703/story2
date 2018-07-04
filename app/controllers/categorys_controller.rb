class CategorysController < ApplicationController

  before_action :set_category, only: [:index, :show, :newest, :oldest, :popular]
  before_action :set_sort, only: [:index, :show, :newest]

  def oldest
    @storys = Story.where(category_id: params[:id]).page(params[:page]).per(12).order('created_at ASC')
  end

  def popular
    @storys = Story.where(category_id: params[:id]).page(params[:page]).per(12).order('likes_count DESC')
  end

  private

    def set_category
      @categorys = Category.all
      @category = Category.find(params[:id])
    end

    def set_sort
      @storys = Story.where(category_id: params[:id]).page(params[:page]).per(12).order('created_at DESC')
    end
end
