class HomeController < ApplicationController
    def index
    @story = Story.new
    @storys = Story.all.page(params[:page]).per(2).reverse
  end
end
