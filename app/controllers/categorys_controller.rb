class CategorysController < ApplicationController

  before_action :set_category, only: [:index, :show, :newest, :oldest]
  before_action :set_sort, only: [:index, :show]

  def newest
    @storys = Story.where(category_id: params[:id]).order("created_at DESC")
  end

  def oldest
    @storys = Story.where(category_id: params[:id]).order("created_at ASC")
  end

  private

    def set_category
      @categorys = Category.all
      @category = Category.find(params[:id])
    end

    def set_sort
      @storys = Story.where(category_id: params[:id])
      @story = Story.all.page(params[:page]).per(2).order('created_at DESC')
    end
end
