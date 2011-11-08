require 'spec_helper'

describe PageController do
  context "#view" do
    it "should assign the page" do
      page = create :page
      get :view, key: page.key
      assigns[:page].key.should == page.key
    end
  end
end
