require "factory_girl_rails"

FactoryGirl.define do

  factory :song do
    sequence :title do |n| 
      "Song#{n}"
    end
    artist
  end
  
  factory :artist do
    sequence :name do |n| 
      "Caamp #{n}"
    end
    image_path "https://i.ytimg.com/vi/Glf6qmJ2dm8/maxresdefault.jpg"
    factory :artist_with_songs do
      after(:create) do |artist|
        create_list(:song, 5, artist: artist)
      end
    end
  end

end
