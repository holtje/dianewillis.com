class HomeController < ApplicationController
  def view
    @page = Page.find_by_name "home"
    if stale?(:etag => @page, :last_modified => @page.updated_at.utc)
      respond_to do |format|
        format.html
      end
    end
  end
end
