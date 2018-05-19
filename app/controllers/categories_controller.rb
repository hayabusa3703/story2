class CategoriesController < ApplicationController
  def index
    @categorys = Category.all
    @storys = Story.where(category_id: params[:format])
  end
end
