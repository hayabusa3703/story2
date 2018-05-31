class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  TOPSTORYS = 4

  def index
    @user = User.find(current_user.id)
    @storys = Story.page(params[:page]).per(TOPSTORYS).by_created_at
    @categorys = Category.all
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :name, :email, :password, :password_confirmation, :image, :text ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end

