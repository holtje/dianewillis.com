class PageController < ApplicationController
  before_filter :require_login, :only => [:mercury_update]
 
  def show
    if params.key? :key
      @page = Page.find_by_key params[:key]
    else
      @page = Page.find(params[:id])
    end
    if @page
      respond_to do |format|
        format.html
      end
    else
      render :status => 404
    end
  end

  def mercury_update
    page = Page.find(params[:id])
    page.title = params[:content][:title][:value]
    page.body = params[:content][:body][:value]
    page.save!
    render text: ""
  end
end
