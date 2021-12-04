require 'rails_helper'

RSpec.describe "parks index page", type: :feature do
  it 'can see all park names' do
    park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: true)
    park_2 = Park.create!(name: "Glacier National Park",
                          entrance_fee: 30,
                          ocean_access: false)

    visit "/parks"

    expect(page).to have_content(park_1.name)
    expect(page).to have_content(park_2.name)
  end

  it 'can see all park names' do
    park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: true)
    park_2 = Park.create!(name: "Glacier National Park",
                          entrance_fee: 30,
                          ocean_access: false)

    visit "/parks"

    expect(page).to have_content(park_1.created_at)
    expect(page).to have_content(park_2.created_at)
  end

  it 'can link to create new park' do
    visit '/parks'
    expect(page).to have_content('New Park')
  end

  it 'routes to /parks/new' do
    visit '/parks'
    click_link('New Park')
    expect(current_path).to eq('/parks/new')
  end
end
