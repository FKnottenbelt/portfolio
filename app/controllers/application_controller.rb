class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = FkViewTool::Renderer.copyright 'F.Knottenbelt', 'All rights reserved'
  end
end

module FkViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.new.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end
