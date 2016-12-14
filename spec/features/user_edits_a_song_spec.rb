=begin 
As a user
Given that a song exists in the database
When I visit that song's show page
And I click on "Edit"
And I fill in a new title
And I click on "Update Song"
Then I should see the song's updated name
Then I should see a link to the song artist's individual page
=end
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
    expect(page).to have_link @artist.name, href: arist_path(@artist)
  end

end