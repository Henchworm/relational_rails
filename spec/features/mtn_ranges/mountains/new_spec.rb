require 'rails_helper'

RSpec.describe "Mountain Creation" do
  it 'links to the new page page from Park-Hikes Index' do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                          natl_park_land: true,
                          drivetime: 16)
    visit "/mtn_ranges/#{mtn_range_1.id}/mountains"

    click_link "Create Mountain for #{mtn_range_1.name}"
    expect(current_path).to eq("/mtn_ranges/#{mtn_range_1.id}/mountains/new")
  end

  it 'can create a new hike' do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                          natl_park_land: true,
                          drivetime: 16)
    visit "/mtn_ranges/#{mtn_range_1.id}/mountains/new"

    fill_in('name', with: 'Kaweah Queen')
    fill_in('elevation', with: 13338)
    fill_in('safe_winter_route', with: false)

    click_button 'Create Mountain'

    expect(current_path).to eq("/mtn_ranges/#{mtn_range_1.id}/mountains")
    expect(page).to have_content('Kaweah Queen')
  end
end
