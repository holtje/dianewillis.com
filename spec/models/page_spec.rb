require 'spec_helper'

describe Page do
  it "should enjoy sunny days" do
    happy_page = create :page
    happy_page.should be_valid
  end

  describe "#key" do
    it "should not allow duplicates" do
      create :page, key: "page"
      dup = build :page, key: "page"
      dup.should_not be_valid
    end

    it "should not be allow to be empty" do
      bad_page = build :page, key: ""
      bad_page.should_not be_valid
    end
  end

  describe "#body" do
    it "should not be allow to be empty" do
      bad_page = build :page, body: ""
      bad_page.should_not be_valid
    end
  end
end
