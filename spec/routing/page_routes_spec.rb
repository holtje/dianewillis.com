require 'spec_helper'

describe PageController do
  describe "routing" do
    it "should handle '/'" do
      get("/").should route_to("page#view", key: 'root')
    end
    it "should handle '/foo' if page foo exists" do
      create :page, :key => 'foo'
      get("/foo").should route_to("page#view", key: 'foo')
    end
    it "should not handle '/arbitrary-url'" do
      get("/arbitrary-url").should_not be_routable
    end
  end
end
