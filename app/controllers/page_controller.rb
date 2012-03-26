class PageController < ApplicationController
  before_filter :require_login, :only => [:mercury_update]

  def page
    @page ||= if params.key? :key
      Page.find_by_key params[:key]
    else
      Page.find(params[:id])
    end
  end

  def show
    if page
      respond_to do |format|
        format.html
      end
    else
      render :status => 404
    end
  end

  def update
    page.title = params[:content][:title][:value]
    page.body = params[:content][:body][:value]
    page.save!
    render text: ""
  end
end
