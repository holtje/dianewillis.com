class HomeController < ApplicationController
  def view
    @page = Page.find_by_name "home"
    respond_to do |format|
      format.html
    end
  end
end
