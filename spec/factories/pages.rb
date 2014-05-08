# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  body       :text             not null
#  created_at :datetime
#  updated_at :datetime
#  key        :string(255)      not null
#
# Indexes
#
#  index_pages_on_key   (key)
#  index_pages_on_name  (title) UNIQUE
#

# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    sequence(:title) { |n| "Page ##{n}" }
    sequence(:key) { |n| "key#{n}" }
    body '<p>This is a <i>page</i>.</p>'
  end
end
