require 'rails_helper'

RSpec.feature 'User visits the artists index page' do
  before do
    @artists = create_list(:artist, 10)
    visit artists_path
  end
  
  it "they see an All Artists heading" do
    within "h1" do 
      expect(page).to have_content "All Artists" 
    end
  end

  it 'they see a list of artists' do
    @artists.each do |artist|
      expect(page).to have_link "#{artist.name}", artist.image_path
    end
  end

  it "and they see a link to create a new artist" do
    expect(page).to have_link "New Artist", new_artist_path
  end
  
end