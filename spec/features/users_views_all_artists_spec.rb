require 'rails_helper'

RSpec.feature 'User visits the artists index page' do
  before do
    artists = create_list(:artist, 10)
  end
end