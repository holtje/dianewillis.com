require 'spec_helper'

describe Page do
  it "should enjoy sunny days" do
    happy_page = create :page
    happy_page.should be_valid
  end

  describe "#name" do
    it "should not allow duplicates" do
      create :page, name: "page"
      dup = build :page, name: "page"
      dup.should_not be_valid
    end

    it "should not be allow to be empty" do
      bad_page = build :page, name: ""
      bad_page.should_not be_valid
    end
  end

  describe "#body" do
    it "should not be allow to be empty" do
      bad_page = build :page, body: ""
      bad_page.should_not be_valid
    end
  end

  describe "#rendered" do
    it "should always be set" do
      create(:page).rendered.should be
    end
    it "should change when the body is and saved" do
      page = create :page
      old_rendered = page.rendered
      page.body = "*new text*!"
      page.save!
      page.rendered.should_not == old_rendered
      page.rendered.should include "new text"
    end
  end
end
