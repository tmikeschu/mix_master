require 'rails_helper'

RSpec.feature "User edits a song" do
  
  before do
    @artist = create(:artist_with_songs)
    @songs  = @artist.songs
    @song   = @songs[2]
    visit song_path(@song)
  end

  scenario "they update a song's title" do
    new_title = "Spotify Ads Suck"
    click_on "Edit"
    fill_in "song_title", with: new_title
    click_on "Update Song"
    expect(page).to have_content new_title
    expect(page).to have_link @artist.name, href: artist_path(@artist)
  end

end