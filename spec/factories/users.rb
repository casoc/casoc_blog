# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :user do
    user_name { Faker::Name.name }
    password "scret_word"
    email { Faker::Internet.email }
    password_confirmation "scret_word"

    factory :admin do
      admin 1
    end
  end
end
