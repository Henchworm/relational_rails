require 'rails_helper'

RSpec.describe 'the parks show page' do
  before(:each) do
    @park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: false)

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
end
