# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    sequence(:email) { |n| "admin#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }
    password_confirmation { |au| au.password }
  end
end
