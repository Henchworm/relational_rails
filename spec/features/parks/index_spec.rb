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

  it 'has link to delete each park' do
    park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: true)
    park_2 = Park.create!(name: "Glacier National Park",
                          entrance_fee: 30,
                          ocean_access: false)
    visit '/parks'
    expect(page).to have_link('Delete Rocky Mountain National Park')
    expect(page).to have_link('Delete Glacier National Park')
  end

  it 'can delete a park from the index page' do
    park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: true)
    park_2 = Park.create!(name: "Glacier National Park",
                          entrance_fee: 30,
                          ocean_access: false)
    visit '/parks'
    click_link("Delete #{park_1.name}")
    expect(current_path).to eq("/parks")
    expect(page).to_not have_content(park_1.name)
    expect(page).to have_content(park_2.name)
  end

  it 'has link_to order the parks by their number of hikes' do
    park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: true)
    park_2 = Park.create!(name: "Glacier National Park",
                          entrance_fee: 30,
                          ocean_access: false)
    visit '/parks'
    expect(page).to have_link('Sort Parks by the number of hikes')
  end

  it 'can sort all the parks on the index by their number of hikes' do
    park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: true)
    park_2 = Park.create!(name: "Glacier National Park",
                          entrance_fee: 30,
                          ocean_access: false)
    hike_1 = park_1.hikes.create!(name: "Ypsilon",
                          mileage: 9,
                          elevation_gain: 4000,
                          water_on_route: true)
    hike_2 = park_2.hikes.create!(name: "Cracker Lake",
                          mileage: 12,
                          elevation_gain: 1500,
                          water_on_route: true)
    hike_3 = park_2.hikes.create!(name: "Huckleberry Lookout",
                          mileage: 12,
                          elevation_gain: 2000,
                          water_on_route: true)
    visit '/parks'
    click_link 'Sort Parks by the number of hikes'
    expect(current_path).to eq("/parks")
    expect(park_2.name).to appear_before(park_1.name)
  end

  it 'lists the number of hikes the park has once the link is clicked' do
    park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: true)
    park_2 = Park.create!(name: "Glacier National Park",
                          entrance_fee: 30,
                          ocean_access: false)
    hike_1 = park_1.hikes.create!(name: "Ypsilon",
                          mileage: 9,
                          elevation_gain: 4000,
                          water_on_route: true)
    hike_2 = park_2.hikes.create!(name: "Cracker Lake",
                          mileage: 12,
                          elevation_gain: 1500,
                          water_on_route: true)
    hike_3 = park_2.hikes.create!(name: "Huckleberry Lookout",
                          mileage: 12,
                          elevation_gain: 2000,
                          water_on_route: true)
    visit '/parks'
    click_link 'Sort Parks by the number of hikes'
    expect(current_path).to eq("/parks")
    expect(page).to have_content("Hike Count: #{park_1.hike_count}")
    expect(page).to have_content("Hike Count: #{park_2.hike_count}")
    expect("Hike Count: #{park_2.hike_count}").to appear_before("Hike Count: #{park_1.hike_count}")
  end
end
