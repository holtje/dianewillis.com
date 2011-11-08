class PageController < ApplicationController
  def view
    @page = Page.find_by_key params[:key]
    if @page
      respond_to do |format|
        format.html
      end
    else
      render :status => 404
    end
  end
end
