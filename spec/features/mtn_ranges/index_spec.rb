require 'rails_helper'

RSpec.describe "mtnrange index page", type: :feature do
  it 'can see all mtnrange names' do
    mtn_range_1 = MtnRange.create!(name: "Bridgers",
                          natl_park_land: false,
                          drivetime: 11)
    visit "/mtn_ranges"

    expect(page).to have_content(mtn_range_1.name)
  end
end