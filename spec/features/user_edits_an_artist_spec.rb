require 'rails_helper'

RSpec.feature "User edits an artist" do 

  before do
    @artist = create(:artist)
  end

  scenario "they update an artists' info" do
    old_image_path = @artist.image_path
    old_name = @artist.name
    new_name = "Borns"
    visit artists_path
    expect(page).to have_content old_name
    click_on "#{@artist.name}"
    click_on "Edit"
    fill_in "artist_name", with: new_name
    click_on "Update Artist"
    expect(page).to have_content new_name
    expect(page).to_not have_content old_name
    expect(page).to have_css "img[src=\"#{@artist.image_path}\"]"
    expect(old_image_path).to eq(@artist.image_path)
  end

  context "when they update invalid data" do
    scenario "they see an error message" do
      new_name = nil
      visit artists_path
      click_on "#{@artist.name}"
      click_on "Edit"
      fill_in "artist_name", with: new_name
      click_on "Update Artist"
      expect(page).to have_content "Name can't be blank"
    end
  end
end