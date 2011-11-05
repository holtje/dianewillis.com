require 'rendered_model'

class Page < ActiveRecord::Base
  include RenderedModel

  validates :name,
    :length => { :minimum => 1, :maximum => 128, },
    :presence => true,
    :uniqueness => true

  validates :body,
    :presence => true
end
