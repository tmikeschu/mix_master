=begin 
As a user
Given that playlists exist in the database
When I visit the playlists index
Then I should see each playlist's name
And each name should link to that playlist's individual page
=end 
require 'rails_helper'

RSpec.feature "User views all playlists" do

  before do
    @playlists = create_list(:playlist_with_songs, 5)
    visit playlists_path
  end

  it "they see and All Playlists heading" do
    within "h1" do
      expect(page).to have_content "All Playlists"
    end
  end

  it "they see a list of playlists links" do
    @playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end
  end

  it "and a playlist link takes them to the show page for that playlist" do
    save_and_open_page
    click_on @playlists.first.name
    expect(current_path).to eq playlist_path(@playlists.first)
  end

end