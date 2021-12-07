require 'rails_helper'

RSpec.describe 'hikes index page', type: :feature do
  before(:each) do

    @park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: false)

    @hike_1 = @park_1.hikes.create!(name: "Sky Pond",
                          mileage: 12,
                          elevation_gain: 1600,
                          water_on_route: true)

    @hike_2 = @park_1.hikes.create!(name: "Moomaw Glacier",
                          mileage: 20,
                          elevation_gain: 4000,
                          water_on_route: true)

    visit "/hikes"
  end


  it 'displays each hike name' do
    expect(page).to have_content(@hike_1.name)
    expect(page).to have_content(@hike_2.name)
  end

  it 'displays the mileage of each hike' do
    expect(page).to have_content(@hike_1.mileage)
    expect(page).to have_content(@hike_2.mileage)
  end

  it 'displays the elevation_gain of each hike' do
    expect(page).to have_content(@hike_1.elevation_gain)
    expect(page).to have_content(@hike_2.elevation_gain)
  end

  it 'displays whether or not there is water on the route for each hike' do
    expect(page).to have_content(@hike_1.water_on_route)
    expect(page).to have_content(@hike_2.water_on_route)
  end

  it 'displays link to edit next to each hike' do
    expect(page).to have_link("Edit Sky Pond")
    expect(page).to have_link("Edit Moomaw Glacier")
  end

  it 'routes to /hikes/:id/edit' do
    click_link "Edit #{@hike_2.name}"
    expect(current_path).to eq("/hikes/#{@hike_2.id}/edit")
  end

  it 'has link to delete each hike' do
    expect(page).to have_link('Delete Sky Pond')
    expect(page).to have_link('Delete Moomaw Glacier')
  end

  it 'can delete a hike from the index page' do
    click_link("Delete #{@hike_1.name}")
    expect(current_path).to eq("/hikes")
    expect(page).to_not have_content(@hike_1.name)
    expect(page).to have_content(@hike_2.name)
  end
end
