class GalleriesController < ApplicationController

  def index
    @gallery_items = Gallery.all
  end

  def new
    @gallery_item = Gallery.new
    
    # create 3 technologies for this gallery item
    3.times { @gallery_item.technologies.build }
  end

  def create
    @gallery_item = Gallery.new(params.require(:gallery).permit(:title, :subtitle, :body, 
       technologies_attributes: [:name]))

    respond_to do |format|
      if @gallery_item.save
        format.html { redirect_to galleries_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end 
  end

  def edit
    @gallery_item = Gallery.find(params[:id])
  end

  def update
    @gallery_item = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery_item.update(params.require(:gallery).permit(:title, :subtitle, :body, 
         technologies_attributes: [:name]))
        format.html { redirect_to galleries_path, notice: 'Portfolio item was updated.' }
      else
        format.html { render :edit }
      end
    end
  end  

  def show
    @gallery_item = Gallery.find(params[:id])
  end

  def destroy
    @gallery_item = Gallery.find(params[:id])
    @gallery_item.destroy

    respond_to do |format|
      format.html { redirect_to galleries_path, notice: 'Portfolio item was successfully destroyed.' }
    end
  end
end
