require 'rails_helper'

RSpec.describe 'the parks show page' do
  before(:each) do
    @park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: false)
    @hike_1 = @park_1.hikes.create!(name: "Sky Pond",
                                  mileage: 12,
                                  elevation_gain: 1600,
                                  water_on_route: true)

    visit "/parks/#{@park_1.id}"
  end

  it 'displays the park name' do
    expect(page).to have_content(@park_1.name)
  end

  it 'displays the park entrance fee' do
    expect(page).to have_content(@park_1.entrance_fee)
  end

  it 'displays whether the park has ocean access' do
    expect(page).to have_content(@park_1.ocean_access)
  end

  it 'displays the number of hikes associated with it' do

    expect(page).to have_content("Hike Count: 1")
  end

  it 'has link to update park' do
    # visit "/parks/#{park_1.id}"
    expect(page).to have_link("Update #{@park_1.name}")
  end

  it 'routes to /parks/:id/edit' do
    # visit "/parks/#{park_1.id}"
    click_link("Update #{@park_1.name}")
    expect(current_path).to eq("/parks/#{@park_1.id}/edit")
  end

  it 'has a link to delete a park' do
    expect(page).to have_link("Delete #{@park_1.name}")
  end

  it 'routes to /parks' do
    click_link("Delete #{@park_1.name}")
    expect(current_path).to eq("/parks")
    expect(page).to_not have_content(@park_1.name)
    expect(page).to_not have_content(@hike_1.name)
  end

  it 'does not display deleted record and associated info' do
    click_link("Delete #{@park_1.name}")

    expect(page).to_not have_content(@park_1.name)
    expect(page).to_not have_content(@hike_1.name)
  end
end
