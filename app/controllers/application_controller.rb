class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @categorys = Category.all
  end
end
