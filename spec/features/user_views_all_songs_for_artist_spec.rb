require 'rails_helper'

RSpec.feature "User views all songs for an artist" do
  
  before do
    @artist = create(:artist_with_songs)
    @artist.songs.create(title: "Don't Stop Beliebin")
    @artist.songs.create(title: "Zorp")
    @songs  = @artist.songs
    visit artist_path(@artist)
  end

  scenario "they vist the songs index for an artist" do
    click_on "View Songs"
    @songs.each_with_index do |song, index|
      expect(page).to have_link song.title, href: song_path(song)
    end
    (@songs.length - 1).times do |i|
      expect(page.find("li:nth-child(#{i + 1})").text).to be < page.find("li:nth-child(#{i + 2})").text
    end
  end
end