require 'rails_helper'

RSpec.describe "Hike Creation" do
  it 'links to the new page page from Park-Hikes Index' do
    park = Park.create!(name: "Rocky Mountain National Park", entrance_fee: 30, ocean_access: false)
    visit "/parks/#{park.id}/hikes"

    click_link "Create Hike for #{park.name}"
    expect(current_path).to eq("/parks/#{park.id}/hikes/new")
  end

  it 'can create a new hike' do
    park = Park.create!(name: "Rocky Mountain National Park", entrance_fee: 30, ocean_access: false)
    visit "/parks/#{park.id}/hikes/new"

    fill_in('name', with: 'Finch Lake')
    fill_in('mileage', with: 12)
    fill_in('elevation_gain', with: 1500)
    fill_in('water_on_route', with: false)

    click_button 'Create Hike'

    expect(current_path).to eq("/parks/#{park.id}/hikes")
    expect(page).to have_content('Finch Lake')
  end
end
