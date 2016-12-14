class Playlist < ApplicationRecord
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
  

  def song_ids=(song_ids)
    songs = song_ids.map do |song_id|
      Song.find(song_id)
    end
    self.songs = songs
  end
end
