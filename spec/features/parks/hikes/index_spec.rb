require 'rails_helper'

RSpec.describe 'Parks hikes index' do
  before(:each)do
    @park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: false)

    @park_2 = Park.create!(name: "Glacier National Park",
                          entrance_fee: 30,
                          ocean_access: false)

    @hike_1 = @park_1.hikes.create!(name: "Sky Pond",
                          mileage: 12,
                          elevation_gain: 1600,
                          water_on_route: true)

    @hike_2 = @park_1.hikes.create!(name: "Moomaw Glacier",
                          mileage: 20,
                          elevation_gain: 4000,
                          water_on_route: true)

    @hike_3 = @park_2.hikes.create!(name: "Cracker Lake",
                          mileage: 12,
                          elevation_gain: 2000,
                          water_on_route: true)

    visit "/parks/#{@park_1.id}/hikes"
  end

  it 'displays all of the hikes associated with that Park by name' do
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

  it 'has link to creeate a new hike for that park' do
    expect(page).to have_link("Create Hike for #{@park_1.name}")
  end

  it 'routes to /parks/:park_id/hikes/new' do
    click_link "Create Hike for #{@park_1.name}"
    expect(current_path).to eq("/parks/#{@park_1.id}/hikes/new")
  end
end

RSpec.describe 'Parks hikes index' do
  before(:each)do
    @park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: false)

    @park_2 = Park.create!(name: "Glacier National Park",
                          entrance_fee: 30,
                          ocean_access: false)

    @hike_1 = @park_1.hikes.create!(name: "Sky Pond",
                          mileage: 12,
                          elevation_gain: 1600,
                          water_on_route: true)

    @hike_2 = @park_1.hikes.create!(name: "Moomaw Glacier",
                          mileage: 20,
                          elevation_gain: 4000,
                          water_on_route: true)

    @hike_3 = @park_2.hikes.create!(name: "Cracker Lake",
                          mileage: 12,
                          elevation_gain: 2000,
                          water_on_route: true)

    visit "/parks/#{@park_2.id}/hikes"
  end

  it 'displays all of the hikes associated with that Park by name' do
    expect(page).to have_content(@hike_3.name)
  end

  it 'displays the mileage of each hike' do
    expect(page).to have_content(@hike_3.mileage)
  end

  it 'displays the elevation_gain of each hike' do
    expect(page).to have_content(@hike_3.elevation_gain)
  end

  it 'displays whether or not there is water on the route for each hike' do
    expect(page).to have_content(@hike_3.water_on_route)
  end

end
