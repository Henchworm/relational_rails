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

  it 'has link to create new park' do
    visit '/parks'
    expect(page).to have_link('New Park')
  end

  it 'routes to /parks/new' do
    visit '/parks'
    click_link('New Park')
    expect(current_path).to eq('/parks/new')
  end

  it 'has link to edit page for each park' do
    park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: true)
    park_2 = Park.create!(name: "Glacier National Park",
                          entrance_fee: 30,
                          ocean_access: false)
    visit '/parks'
    expect(page).to have_link('Edit Rocky Mountain National Park')
    expect(page).to have_link('Edit Glacier National Park')
  end

  it 'routes to /parks/:id/edit' do
    park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: true)
    park_2 = Park.create!(name: "Glacier National Park",
                          entrance_fee: 30,
                          ocean_access: false)
    visit '/parks'
    click_link("Edit #{park_1.name}")
    expect(current_path).to eq("/parks/#{park_1.id}/edit")
  end
end
