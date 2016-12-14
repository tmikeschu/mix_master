=begin
As a user
Given that an artist and that artist's associated songs exist in the database
When I visit the individual artist page
And I click "View songs"
Then I should see the song titles for that specific artist sorted alphabetically
And each title should link to the individual song page
rescue => exception
=end

RSpect.feature "User views all songs for an artist" do
  
  before do
    @artist = create(:artist_with_songs)
    @songs  = @artist.songs
    visit artist_path(@artist)
  end

  scenario "they vist the songs index for an artist" do
    click_on "View Songs"
    @songs.each do |song|
      expect(page).to have_link song.title, href: song_path(@song)
    end
  end
end