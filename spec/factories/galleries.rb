# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gallery do
    image { File.new("#{Rails.root}/spec/factories/gallery.jpg") }
    title "MyString"
    alt "MyString"
    association :user
  end
end
