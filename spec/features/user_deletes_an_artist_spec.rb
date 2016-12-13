require 'rails_helper'

RSpec.feature "User deletes an artist" do

  before do
    @artist = create(:artist)
  end

  context "when they delete an artist" do
    it "that artist is deleted from the database" do
      visit artists_path
      click_on @artist.name
      click_on "Delete"
      expect(current_path).to eq(artists_path)
      expect(page).to_not have_content @artist.name
    end
  end

end