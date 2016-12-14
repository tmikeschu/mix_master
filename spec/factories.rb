require "factory_girl_rails"

FactoryGirl.define do
  factory :playlist do
    sequence :name do |n| 
      "playlist #{n}"
    end

    factory :playlist_with_songs do
      after(:create) do |playlist|
        playlist.songs = create_list(:song, 5)
      end
    end
  end

  factory :song do
    sequence :title do |n| 
      "Song#{n}"
    end
    artist

    factory :song_with_playlists do
      after(:create) do |song|
        song.playlists = create_list(:playlist, 5)
      end
    end
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
