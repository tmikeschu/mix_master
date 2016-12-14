require "factory_girl_rails"

FactoryGirl.define do
  factory :song do
    title "MyString"
  end
  factory :artist do
    sequence :name do |n| 
      "Caamp #{n}"
    end
    image_path "https://i.ytimg.com/vi/Glf6qmJ2dm8/maxresdefault.jpg"
  end
end
