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

    visit "/hikes"
  end


  it 'displays each hike name' do
    expect(page).to have_content(@hike_1.name)
  end

  it 'displays the attributes of each hike' do
    expect(page).to have_content(@hike_1.mileage)
    expect(page).to have_content(@hike_1.elevation_gain)
    expect(page).to have_content(@hike_1.water_on_route)
  end
end
