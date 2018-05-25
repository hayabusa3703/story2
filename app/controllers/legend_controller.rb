class LegendController < ApplicationController
  LEGENDSTORYS = 12

# まだ未実装の機能のため、この形で一時保存しています。

  def index
    @story = Story.new
    @storys = Story.all.page(params[:page]).per(LEGENDSTORYS).order('created_at DESC')
    @categorys = Category.all
  end
end
