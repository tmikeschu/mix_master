require 'rails_helper'

RSpec.feature "User creates a playlist" do
  before do
    @artists = create_list(:artist_with_songs, 10)
    @songs = @artists.flat_map { |artist| artist.songs }
  end

  scenario "they visit the playlists index" do
    song1, song2, song3 = @songs[3..5]
    playlist_name = "Chill Vibes"
    visit playlists_path
    click_on "New Playlist"
    fill_in "playlist_name", with: playlist_name
    check("song-#{song1.id}")
    check("song-#{song2.id}")
    check("song-#{song3.id}")
    click_on "Create Playlist"
    expect(page).to have_content playlist_name
    within "ul" do
      expect(page).to have_link song1.title, href: song_path(song1)
      expect(page).to have_link song2.title, href: song_path(song2)
      expect(page).to have_link song3.title, href: song_path(song3)
    end
    click_on song1.title
    expect(current_path).to eq(song_path(song1))
  end

end