class Page < ActiveRecord::Base
  validates :title,
    :length => { :minimum => 0, :maximum => 255 },
    :presence => true

  validates :key,
    :format => { :with => /^[a-z0-9_-]+$/i },
    :presence => true,
    :uniqueness => true

  validates :body,
    :presence => true


  def body
    read_attribute(:body).html_safe
  end
  def body= value
    write_attribute(:body, Redcarpet::Render::SmartyPants.render(value))
  end
  def title
    read_attribute(:title).html_safe
  end
  def title= value
    write_attribute(:title, Redcarpet::Render::SmartyPants.render(value))
  end
end
