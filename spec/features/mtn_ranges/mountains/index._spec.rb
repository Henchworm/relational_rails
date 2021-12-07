require 'rails_helper'

RSpec.describe 'the MtnRangeMountainController index' do
  before(:each) do
    @mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                                  natl_park_land: false,
                                  drivetime: 16)
    @mountain_1 = @mtn_range_1.mountains.create!(name: "Black Kaweah",
                                               elevation: 13681,
                                               safe_winter_route: false)
    @mountain_2 = @mtn_range_1.mountains.create!(name: "Red Kaweah",
                                                 elevation: 13720,
                                                 safe_winter_route: false)

    @mountain_3 = @mtn_range_1.mountains.create!(name: "Homer's Nose",
                                                elevation: 10000,
                                                safe_winter_route: true)

    visit "/mtn_ranges/#{@mtn_range_1.id}/mountains"
  end

  it 'displays the mtn_range name' do
    expect(page).to have_content(@mtn_range_1.name)
  end

  it "displays the mountain name" do
    expect(page).to have_content(@mountain_1.name)
    expect(page).to have_content(@mountain_2.name)

  end

  it "displays the mountain elevation" do
    expect(page).to have_content(@mountain_1.elevation)
    expect(page).to have_content(@mountain_2.elevation)

  end

  it "displays whether or not there is a safe winter route" do
    expect(page).to have_content(@mountain_1.safe_winter_route)
    expect(page).to have_content(@mountain_2.safe_winter_route)

  end

  it 'has link to create a new mountain for that mtn_range' do
    expect(page).to have_link("Create Mountain for #{@mtn_range_1.name}")
  end

  it 'routes to /mtn_ranges/:mtn_range_id/mountains/new' do
    click_link "Create Mountain for #{@mtn_range_1.name}"
    expect(current_path).to eq("/mtn_ranges/#{@mtn_range_1.id}/mountains/new")
  end
end

  RSpec.describe 'the MtnRangeMountainController index' do
    before(:each) do
      @mtn_range_2 = MtnRange.create!(name: "Rocky Mountains",
                                    natl_park_land: false,
                                    drivetime: 16)
      @mountain_1 = @mtn_range_2.mountains.create!(name: "Longs Peak",
                                                 elevation: 14259,
                                                 safe_winter_route: false)
      @mountain_2 = @mtn_range_2.mountains.create!(name: "Quandary Peak",
                                                   elevation: 14271,
                                                   safe_winter_route: true)
     @mountain_3 = @mtn_range_2.mountains.create!(name: "Bald Peak",
                                                 elevation: 10000,
                                                 safe_winter_route: true)

      visit "/mtn_ranges/#{@mtn_range_2.id}/mountains"
    end


  it 'displays the mtn_range name' do
    expect(page).to have_content(@mtn_range_2.name)
  end

  it "displays the mountain name" do
    expect(page).to have_content(@mountain_1.name)
    expect(page).to have_content(@mountain_2.name)
  end

  it "displays the mountain elevation" do
    expect(page).to have_content(@mountain_1.elevation)
    expect(page).to have_content(@mountain_2.elevation)
  end

  it "displays whether or not there is a safe winter route" do
    expect(page).to have_content(@mountain_1.safe_winter_route)
    expect(page).to have_content(@mountain_2.safe_winter_route)
  end

  it "displays a button " do
    expect(page).to have_button("Only return mountains with elevation greater than given number")
  end

  it "routes back to mtn_ranges mountains index" do
    fill_in :num, with: 13000
    click_button("Only return mountains with elevation greater than given number")
    expect(current_path).to eq("/mtn_ranges/#{@mtn_range_2.id}/mountains")
  end

  it "displays elevations over threshold 10000" do
    fill_in :num, with: 13000
    click_button("Only return mountains with elevation greater than given number")
    expect(page).to have_content(@mountain_1.name)
    expect(page).to have_content(@mountain_2.name)
    expect(page).to_not have_content(@mountain_3.name)
  end

end
