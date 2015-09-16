# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :comment do
    association :article
    email { Faker::Internet.email }
    subject "this is subject"
    message "MyText"
  end
end
