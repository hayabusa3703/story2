class LoveController < ApplicationController

  def index
    @story = Story.new
    @storys = Story.all.page(params[:page]).per(12).reverse
  end

  # def create
  #   @story = Story.new(story_params)
  #   if @story.save
  #     redirect_to :root, notice: 'New story was successfully created'
  #   else
  #     redirect_to ({ action: :new }), alert: 'New story was unsuccessfully created'
  #    end
  # end

end
