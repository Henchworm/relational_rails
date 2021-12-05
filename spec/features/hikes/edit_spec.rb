require 'rails_helper'

RSpec.describe 'Edit hike' do
  it 'has link to the edit page' do
    park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: false)
    hike_1 = park_1.hikes.create!(name: "Sky Pond",
                          mileage: 12,
                          elevation_gain: 1600,
                          water_on_route: true)

    visit "/hikes/#{hike_1.id}"
    click_link "Update #{hike_1.name}"

    expect(current_path).to eq("/hikes/#{hike_1.id}/edit")
  end

  it 'can edit the hike' do
    park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: false)
    hike_1 = park_1.hikes.create!(name: "Sky Ponde",
                          mileage: 12,
                          elevation_gain: 1600,
                          water_on_route: true)
    visit "/hikes/#{hike_1.id}"

    expect(page).to have_content("Sky Ponde")

    visit "/hikes/#{hike_1.id}/edit"
    fill_in('name', with: "Sky Pond")
    fill_in('mileage', with: 13)
    fill_in('elevation_gain', with: 1500)
    fill_in('water_on_route', with: true)
    click_button "Update #{hike_1.name}"

    expect(current_path).to eq("/hikes/#{hike_1.id}")
    expect(page).to have_content("Sky Pond")
    expect(page).to have_content(13)

  end
end
