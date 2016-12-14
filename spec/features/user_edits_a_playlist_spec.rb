=begin
As a user
Given that a playlist and songs exist in the database
When I visit that playlist's show page
And I click on "Edit"
And I enter a new playlist name
And I select an additional song
And I uncheck an existing song
And I click on "Update Playlist"
Then I should see the playlist's updated name
And I should see the name of the newly added song
And I should not see the name of the removed song
=end
require 'rails_helper'

RSpec.feature "User edits a playlist" do
  before do
    @playlist = create(:playlist_with_songs)
    create_list(:song, 10)
    @songs = Song.all
  end

  scenario "they update the playlist" do
    new_playlist_name = "Chill Vibes"
    new_song = @songs.last
    existing_song = @playlist.songs.first

    visit playlist_path(@playlist)
    expect(page).to_not have_content new_playlist_name
    expect(page).to have_link existing_song.title, song_path(existing_song)
    expect(page).to_not have_link new_song.title, song_path(new_song)
    click_on "Edit"

    fill_in "playlist_name", with: new_playlist_name
    check("song-#{new_song.id}")
    uncheck("song-#{existing_song.id}")
    click_on "Update Playlist"

    expect(page).to have_content new_playlist_name
    expect(page).to have_link new_song.title, song_path(new_song)
    expect(page).to_not have_link existing_song.title, song_path(existing_song)
    @playlist.songs[1..-1].each do |song|
      expect(page).to have_link song.title, song_path(song)
    end
  end
end