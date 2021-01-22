class GalleriesController < ApplicationController

  def index
    @gallery_items = Gallery.all
  end


end
