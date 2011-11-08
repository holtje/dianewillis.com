# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    sequence(:title) {|n| "Page ##{n}"}
    sequence(:key) {|n| "key#{n}"}
    body "<p>This is a <i>page</i>.</p>"
  end
end
