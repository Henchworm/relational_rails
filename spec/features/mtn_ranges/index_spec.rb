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

  it "shows link to edit mtn range" do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                          natl_park_land: true,
                          drivetime: 16)

    mtn_range_2 = MtnRange.create!(name: "Rocky Mountains",
                          natl_park_land: false,
                          drivetime: 16)
    visit "/mtn_ranges/"
    expect(page).to have_link("Edit Sierra Nevada")
    expect(page).to have_link("Edit Rocky Mountains")
  end

  it "edit link routes to edit page" do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                          natl_park_land: true,
                          drivetime: 16)
    visit "/mtn_ranges/"
    click_link("Edit Sierra Nevada")
    expect(current_path).to eq("/mtn_ranges/#{mtn_range_1.id}/edit")
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

  it 'has link_to order the mtn_ranges by their number of mountains' do
    visit '/mtn_ranges'

    expect(page).to have_link('Sort Mountain Ranges by the number of mountains')
  end

  it "can sort all mtn ranges in the index page by their number of mountains" do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                        natl_park_land: true,
                        drivetime: 16)

    mtn_range_2 = MtnRange.create!(name: "Rocky Mountains",
                        natl_park_land: false,
                        drivetime: 16)
    mountain_1 = mtn_range_1.mountains.create!(name: "Black Kaweah",
                                                  elevation: 13720,
                                                  safe_winter_route: false)
    mountain_2 = mtn_range_1.mountains.create!(name: "Red Kaweah",
                                                  elevation: 13720,
                                                  safe_winter_route: false)

    mountain_3 = mtn_range_2.mountains.create!(name: "Long's Peak",
                                                elevation: 10000,
                                                safe_winter_route: true)
    visit "/mtn_ranges"
    click_link("Sort Mountain Ranges by the number of mountains")
    expect(current_path).to eq("/mtn_ranges")
    expect(mtn_range_1.name).to appear_before(mtn_range_2.name)
  end

  it "shows the count of mountains per range after clicking sort mountain ranges by number of mountains" do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                        natl_park_land: true,
                        drivetime: 16)

    mtn_range_2 = MtnRange.create!(name: "Rocky Mountains",
                        natl_park_land: false,
                        drivetime: 16)
    mountain_1 = mtn_range_1.mountains.create!(name: "Black Kaweah",
                                                  elevation: 13720,
                                                  safe_winter_route: false)
    mountain_2 = mtn_range_1.mountains.create!(name: "Red Kaweah",
                                                  elevation: 13720,
                                                  safe_winter_route: false)

    mountain_3 = mtn_range_2.mountains.create!(name: "Long's Peak",
                                                elevation: 10000,
                                                safe_winter_route: true)
    visit "/mtn_ranges"
    click_link("Sort Mountain Ranges by the number of mountains")
    expect(page).to have_content(mtn_range_1.mountain_count)
    expect(page).to have_content(mtn_range_2.mountain_count)
    expect("Mountain Count: #{mtn_range_1.mountain_count}").to appear_before("Mountain Count: #{mtn_range_2.mountain_count}")

end
end
