# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    sequence(:name) {|n| "Page ##{n}"}
    body "This is a _page_."
    rendered "This is a <i>page</i>."
  end
end
