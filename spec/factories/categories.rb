FactoryGirl.define do
  factory :category do
    association :user
    name "test"
  end
end
