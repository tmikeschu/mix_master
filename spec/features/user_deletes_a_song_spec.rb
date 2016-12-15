=begin 
As a user
Given that an artist and a song for that artist exist in the database
When I visit the artist's song index ('/artists/1/songs')
And I click on "Delete"
Then I should be back on whatever page I was on before (the artist's song index page)
And I should not see the the song title
=end

require 'rails_helper'

RSpec.feature "User deletes a song" do

  before do
    @artist = create(:artist)
    song   = create(:song)
    @artist.songs << song
    @song  = @artist.songs.first
  end

  scenario "they visit an artist's song index" do
    visit artist_path(@artist)
    visit artist_songs_path(@artist)
    expect(page).to have_link @song.title, href: song_path(@song)
    click_on "Delete"
    expect(current_path).to eq artist_path(@artist)
    expect(page).to_not have_content @song.title
  end

end