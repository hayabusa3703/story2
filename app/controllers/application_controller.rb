class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  TOP_STORIES_COUNT = 4
  TOP_CATEGORYSTORYS_COUNT = 3

  def index
    @storys = Story.page(params[:page]).per(TOP_STORIES_COUNT).by_created_at
    @categorys = Category.all
    @loves = Story.where(Category_id: 1).limit(TOP_CATEGORYSTORYS_COUNT)
    @love = Story.where(Category_id: 1).limit(1)
    @marriages = Story.where(Category_id: 2).limit(TOP_CATEGORYSTORYS_COUNT)
    @marriage = Story.where(Category_id: 2).limit(1)
    @studies = Story.where(Category_id: 3).limit(TOP_CATEGORYSTORYS_COUNT)
    @study = Story.where(Category_id: 3).limit(1)
    @jobs = Story.where(Category_id: 4).limit(TOP_CATEGORYSTORYS_COUNT)
    @job = Story.where(Category_id: 4).limit(1)
    @newlifes = Story.where(Category_id: 5).limit(TOP_CATEGORYSTORYS_COUNT)
    @newlife = Story.where(Category_id: 5).limit(1)
    @travels = Story.where(Category_id: 6).limit(TOP_CATEGORYSTORYS_COUNT)
    @travel = Story.where(Category_id: 6).limit(1)
    @sicks = Story.where(Category_id: 7).limit(TOP_CATEGORYSTORYS_COUNT)
    @sick = Story.where(Category_id: 7).limit(1)
    @everydaylifes = Story.where(Category_id: 8).limit(TOP_CATEGORYSTORYS_COUNT)
    @everydaylife = Story.where(Category_id: 8).limit(1)
  end

	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end
