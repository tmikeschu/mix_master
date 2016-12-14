require 'rails_helper'

RSpec.feature "User creates a song" do

  before do
    @artists = create_list(:artist, 5)
  end

  scenario 'they see the page for the individual song' do
    artist = @artists.first
    song_title = "Misty"
    visit artists_path
    click_on artist.name
    expect(page).to_not have_content song_title
    click_on "New Song"
    fill_in "song_title", with: song_title
    click_on "Create Song"
    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end

end