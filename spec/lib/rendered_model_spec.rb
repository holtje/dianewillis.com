require 'rendered_model'

class Dummy
  attr_accessor :body, :rendered

  def self.before_save *args
  end

  include RenderedModel
end

describe RenderedModel do
  let(:dummy) { Dummy.new }

  it "renders body to rendered" do
    dummy.body = "_important text_"
    dummy.render_body
    dummy.rendered.should =~ /important text/
  end

  it "should ignore <br/> tags"  do
    dummy.body = "<br/>"
    dummy.render_body
    dummy.rendered.should == ""
  end

  it "should still render <p> tags" do
    dummy.body = "text"
    dummy.render_body
    dummy.rendered.should =~ /<p>/
  end
end
