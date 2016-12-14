require 'rails_helper'

RSpec.describe Playlist,  type: :model do
  describe "associations" do
    it {should have_many(:playlist_songs)}
    it {should have_many(:songs).through(:playlist_songs)}
  end

  describe "validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_uniqueness_of(:name)}
  end
end
