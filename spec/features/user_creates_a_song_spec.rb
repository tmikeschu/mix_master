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
=begin
As a user
Given that an artist exists in the database
When I visit the individual artist page
And I click "New song"
And I click "Create Song"
Then I should see "Title cannot be blank" on the page
=end
  
  context "they forget a title" do
    scenario "they get an error message" do
      click_on @artist.name
      click_on "New Song"
      click_on "Create Song"
      # save_and_open_page
      expect(page).to have_content "Title can't be blank"
    end
  end

end