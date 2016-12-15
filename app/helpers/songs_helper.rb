module SongsHelper
  def alphabetize_songs(songs)
    songs.sort_by { |song| song.title }
  end
end
