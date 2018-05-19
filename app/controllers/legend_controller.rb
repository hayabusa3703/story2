class LegendController < ApplicationController
  def index
    @categorys = Category.all
  end
end
