# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    association :user
    association :category
    title "rspec test"
    content "test"

    factory :invalid do
      title nil
    end
  end
end
