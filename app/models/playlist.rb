class Playlist < ApplicationRecord
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
  
  validates :name, presence: true, uniqueness: true

  def song_ids=(song_ids)
    self.songs = song_ids.map do |song_id|
      Song.find(song_id)
    end
  end
end
