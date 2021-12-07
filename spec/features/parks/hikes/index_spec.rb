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

  it 'has link to sort hikes alphabetically' do
    expect(page).to have_link("Sort Hikes Alphabetically")
  end

  it 'routes to /parks/:park_id/hikes' do

    click_link "Sort Hikes Alphabetically"
    expect(current_path).to eq("/parks/#{@park_1.id}/hikes")
    expect(@hike_2.name).to appear_before(@hike_1.name)
  end

  it 'has link to edit each hike listed for the park' do
    expect(page).to have_link("Edit Sky Pond")
    expect(page).to have_link("Edit Moomaw Glacier")
  end

  it 'routes to /hikes/:id/edit' do
    click_link "Edit #{@hike_1.name}"
    expect(current_path).to eq("/hikes/#{@hike_1.id}/edit")
  end

  it 'displays a submit button' do
    expect(page).to have_button('Only return hikes with mileage greater than the given number')
  end

  it 'routes back to parks hikes index' do
    fill_in :number, with: 15
    click_button 'Only return hikes with mileage greater than the given number'
    expect(current_path).to eq("/parks/#{@park_1.id}/hikes")
  end

  it 'displays only hikes over the given mileage threshold' do
    fill_in :number, with: 15
    click_button 'Only return hikes with mileage greater than the given number'
    expect(page).to have_content(@hike_2.name)
    expect(page).to_not have_content(@hike_1.name)
    expect(page).to_not have_content(@hike_3.name)
  end

  it 'has link to delete each hike for a park' do
    expect(page).to have_link('Delete Sky Pond')
    expect(page).to have_link('Delete Moomaw Glacier')
  end

  it 'can delete a hike from the park hikes index page' do
    click_link("Delete #{@hike_1.name}")
    expect(current_path).to eq("/hikes")
    expect(page).to_not have_content(@hike_1.name)
    expect(page).to have_content(@hike_2.name)
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
