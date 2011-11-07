require 'active_record'
require 'redcarpet'

# Pattern from http://railsforum.com/viewtopic.php?id=31510

module RenderedModel
  class HTML < Redcarpet::Render::SmartyHTML
    def paragraph(text)
      text =~ /^\s*<br\s*\/?>\s*$/ ? '' : "<p>#{text}</p>"
    end
  end

  def self.included(base_class)
    base_class.class_eval do
      include RenderedModel::InstanceMethods

      before_save :render_body
    end
    #base_class.extend ClassMethods
  end

  #module ClassMethods
  #end

  module InstanceMethods
    def markdown
      @markdown ||= Redcarpet::Markdown.new(HTML, {
        autolink: true,
        no_intraemphasis: true,
        lax_html_blocks: true
        })
    end

    ##
    # Updates the rendered field for the meeting.
    def render_body
      self.rendered = markdown.render(self.body) unless self.body.nil?
    end
  end
end
