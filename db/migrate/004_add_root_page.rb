class AddRootPage < ActiveRecord::Migration
  def up
    page = Page.find_by_key('home')
    if page
      page.key = 'root'
      page.save!
    else
      Page.create!(title: "Welcome", body: "<p>Edit me!</p>", key: "root") unless Page.find_by_key('root')
    end
  end
end
