=begin
As a user
Given that songs and artists exist in the database
When I visit the playlists path
And I click "New playlist"
And I fill in a name
And I select the songs for the playlist
And I click "Create Playlist"
Then I see the playlist title
And I see the titles of all songs in that playlist
And the titles should link to the individual song pages
=end
require 'rails_helper'

RSpec.feature "User creates a playlist" do
  before do
    @artists = create_list(:artist_with_songs, 10)
    @songs = @artists.flat_map { |artist| artist.songs }
  end

  scenario "they visit the playlists index" do
    song1, song2, song3 = @songs[3..5]
    visit playlists_path
    click_on "New Playlist"
    check("song-#{song1.id}")
    check("song-#{song2.id}")
    check("song-#{song3.id}")
    click_on "Create Playlist"
  end

end