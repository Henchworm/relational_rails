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
end
