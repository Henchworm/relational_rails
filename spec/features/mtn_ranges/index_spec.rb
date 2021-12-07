require 'rails_helper'

RSpec.describe "mtnrange index page", type: :feature do
  it 'can see all mtnrange names' do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                          natl_park_land: true,
                          drivetime: 16)

    mtn_range_2 = MtnRange.create!(name: "Rocky Mountains",
                          natl_park_land: false,
                          drivetime: 16)
    visit "/mtn_ranges"

    expect(page).to have_content(mtn_range_1.name)
    expect(page).to have_content(mtn_range_2.name)
  end

  it "shows when each of the records was created" do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                          natl_park_land: true,
                          drivetime: 16)

    mtn_range_2 = MtnRange.create!(name: "Rocky Mountains",
                          natl_park_land: false,
                          drivetime: 16)
    visit "/mtn_ranges"

    expect(page).to have_content(mtn_range_1.created_at)
    expect(page).to have_content(mtn_range_2.created_at)
  end

  it 'can link to create new mtn_range' do
    visit "/mtn_ranges/"
    expect(page).to have_content('New Mountain Range')
  end

  it 'routes to /mtn_ranges/new' do
    visit "/mtn_ranges/"
    click_link('New Mountain Range')
    expect(current_path).to eq("/mtn_ranges/new")
  end

  it 'show link to delete mtn_range' do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                          natl_park_land: true,
                          drivetime: 16)

    mtn_range_2 = MtnRange.create!(name: "Rocky Mountains",
                          natl_park_land: false,
                          drivetime: 16)
    visit "/mtn_ranges"

    expect(page).to have_link("Delete Sierra Nevada")
    expect(page).to have_link("Delete Rocky Mountains")
  end

  it 'can link to delete a mountain range next to each mountain range' do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                          natl_park_land: true,
                          drivetime: 16)

    mtn_range_2 = MtnRange.create!(name: "Rocky Mountains",
                          natl_park_land: false,
                          drivetime: 16)
    visit "/mtn_ranges"
    click_link("Delete Sierra Nevada")
    expect(current_path).to eq("/mtn_ranges")
    expect(page).to_not have_content("#{mtn_range_1.name}")
    expect(page).to have_content("#{mtn_range_2.name}")
  end

end
