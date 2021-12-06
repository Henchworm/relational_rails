require 'rails_helper'

RSpec.describe 'the hikes show page' do
  before(:each) do
    @park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: false)

    @hike_1 = @park_1.hikes.create!(name: "Sky Pond",
                          mileage: 12,
                          elevation_gain: 1600,
                          water_on_route: true)

  visit "/hikes/#{@hike_1.id}"
  end

  it 'displays the name of the hike with the given id' do
    expect(page).to have_content(@hike_1.name)
  end

  it 'displays the mileage of the given hike' do
    expect(page).to have_content(@hike_1.mileage)
  end

  it 'displays the elevation gaain of the given hike' do
    expect(page).to have_content(@hike_1.elevation_gain)
  end

  it 'displays whether or not there is water on the route' do
    expect(page).to have_content(@hike_1.water_on_route)
  end

  it 'displays link to update the hike' do
    expect(page).to have_link("Update #{@hike_1.name}")
  end

  it 'has a link that routes to /hikes/:id/edit' do
    click_link "Update #{@hike_1.name}"
    expect(current_path).to eq("/hikes/#{@hike_1.id}/edit")
  end

  it 'has a link to delete a hike' do
    expect(page).to have_link("Delete #{@hike_1.name}")
  end

  it 'routes to /hikes' do
    click_link("Delete #{@hike_1.name}")
    expect(current_path).to eq("/hikes")
  end

  it 'does not display deleted record' do
    click_link("Delete #{@hike_1.name}")
    expect(page).to_not have_content(@hike_1.name)
  end
end
