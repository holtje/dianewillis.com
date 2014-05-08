# encoding: UTF-8
require 'spec_helper'

describe PageController do
  context '#show' do
    it 'should assign the page based on key' do
      page = create :page
      get :show, key: page.key
      assigns[:page].key.should == page.key
    end
    it 'should assign the page based on id' do
      page = create :page
      get :show, id: page.id
      assigns[:page].id.should == page.id
    end
  end
end
