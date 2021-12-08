require 'rails_helper'

RSpec.describe 'Edit mountain' do
  it 'has link to the edit page' do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                                  natl_park_land: false,
                                  drivetime: 16)
    mountain_1 = mtn_range_1.mountains.create!(name: "Black Kaweah",
                                               elevation: 13681,
                                               safe_winter_route: true)

    visit "/mountains/#{mountain_1.id}"
    click_link "Update #{mountain_1.name}"

    expect(current_path).to eq("/mountains/#{mountain_1.id}/edit")
  end

  it 'can edit the hike' do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                                  natl_park_land: false,
                                  drivetime: 16)
    mountain_1 = mtn_range_1.mountains.create!(name: "Black Kaweah",
                                               elevation: 13681,
                                               safe_winter_route: true)

    visit "/mountains/#{mountain_1.id}"

    expect(page).to have_content("Black Kaweah")

    visit "/mountains/#{mountain_1.id}/edit"
    fill_in('name', with: "Red Kaweah")
    fill_in('elevation', with: 13590)
    fill_in('safe_winter_route', with: true)
    click_button "Update #{mountain_1.name}"

    expect(current_path).to eq("/mountains/#{mountain_1.id}")
    expect(page).to have_content("Red Kaweah")
    expect(page).to have_content(13590)

  end
end
