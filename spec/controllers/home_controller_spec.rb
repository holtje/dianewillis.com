require 'spec_helper'

describe HomeController do
  context "#view" do
    it "should render successfully" do
      get :view
      response.should render_template(:view)
    end
    it "should assign the 'home' page to @page" do
      get :view
      assigns[:page].should be
    end
  end
end
