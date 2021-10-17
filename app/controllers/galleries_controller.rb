class GalleriesController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout "gallery"
    access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
  
  def index
    @gallery_items = Gallery.all
  end

  def new
    @gallery_item = Gallery.new
    
    # create 3 technologies for this gallery item
    3.times { @gallery_item.technologies.build }
  end

  def create
    @gallery_item = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery_item.save
        format.html { redirect_to galleries_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end 
  end

  def edit
  end

  def update
    respond_to do |format|
      if @gallery_item.update(gallery_params)
        format.html { redirect_to galleries_path, notice: 'Portfolio item was updated.' }
      else
        format.html { render :edit }
      end
    end
  end  

  def show
  end

  def destroy
    @gallery_item.destroy

    respond_to do |format|
      format.html { redirect_to galleries_path, notice: 'Portfolio item was successfully destroyed.' }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def gallery_params
      params.require(:gallery).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                      )
    end  

    def set_portfolio_item
      @gallery_item = Gallery.find(params[:id])
    end
end

