class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  TOPSTORYS = 4
  CATEGORYSTORYS = 3

  def index
    @storys = Story.page(params[:page]).per(TOPSTORYS).by_created_at
    @categorys = Category.all
    @loves = Story.where(Category_id: 1).limit(CATEGORYSTORYS)
    @love = Story.where(Category_id: 1).limit(1)
    @marriages = Story.where(Category_id: 2).limit(CATEGORYSTORYS)
    @marriage = Story.where(Category_id: 2).limit(1)
  end

	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end
