module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Gallery | My Portfolio website"
    @seo_keywords = "Jane Doe portfolio" 
  end
end