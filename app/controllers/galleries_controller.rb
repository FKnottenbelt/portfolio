class GalleriesController < ApplicationController

  def index
    @gallery_items = Gallery.all
  end

  def new
    @gallery_item = Gallery.new
  end

  def create
    @gallery_item = Gallery.new(params.require(:gallery).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @gallery_item.save
        format.html { redirect_to galleries_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end 
  end
end
