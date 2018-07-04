class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  TOP_STORIES_COUNT = 4
  TOP_CATEGORYSTORYS_COUNT = 3

  def index
    @storys = Story.page(params[:page]).per(TOP_STORIES_COUNT).by_created_at
    @categorys = Category.all
    @loves = Story.love.limit(TOP_CATEGORYSTORYS_COUNT)
    @marriages = Story.marriage.limit(TOP_CATEGORYSTORYS_COUNT)
    @studies = Story.study.limit(TOP_CATEGORYSTORYS_COUNT)
    @jobs = Story.job.limit(TOP_CATEGORYSTORYS_COUNT)
    @newlifes = Story.newlife.limit(TOP_CATEGORYSTORYS_COUNT)
    @travels = Story.travel.limit(TOP_CATEGORYSTORYS_COUNT)
    @sicks = Story.sick.limit(TOP_CATEGORYSTORYS_COUNT)
    @everydaylifes = Story.everydaylife.limit(TOP_CATEGORYSTORYS_COUNT)
  end

	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end
