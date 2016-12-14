require 'rails_helper'

RSpec.feature "User creates a song" do

  before do
    @artists = create_list(:artist, 5)
    @artist = @artists.first
    visit artists_path
  end

  scenario 'they see the page for the individual song' do
    song_title = "Misty"
    click_on @artist.name
    expect(page).to_not have_content song_title
    click_on "New Song"
    fill_in "song_title", with: song_title
    click_on "Create Song"
    expect(page).to have_content song_title
    expect(page).to have_link @artist.name, href: artist_path(@artist)
  end

  context "they forget a title" do
    scenario "they get an error message" do
      click_on @artist.name
      click_on "New Song"
      click_on "Create Song"
      expect(page).to have_content "Title can't be blank"
    end
  end

end