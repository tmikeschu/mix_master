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
    require 'pry'; binding.pry
  end

  scenario "they update the playlist" do
    new_playlist_name = "Chill Vibes"
    new_song = @songs.last
    visit playlist_path(@playlist)
    click_on "Edit"
    fill_in "playlist_name", with: new_playlist_name
    check("song-#{new_song.id}")
    expect(page).to_not have_content new_playlist_name
    click_on "Update Playlist"
    expect(page).to have_content new_playlist_name
    expect(page).to have_link new_song.name, song_path(new_song)
  end
end