require 'rails_helper'

RSpec.describe "mtnrange index page", type: :feature do
  it 'can see all mtnrange names' do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                          natl_park_land: true,
                          drivetime: 16)

    mtn_range_2 = MtnRange.create!(name: "Rocky Mountains",
                          natl_park_land: false,
                          drivetime: 16)
    visit "/mtn_ranges"

    expect(page).to have_content(mtn_range_1.name)
  end
end
