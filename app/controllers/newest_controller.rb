class NewestController < ApplicationController

  def index
    @storys = Story.all.order("id DESC").page(params[:page]).per(4)
    # @storys = Story.find(2)
  end
end
