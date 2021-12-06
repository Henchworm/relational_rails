require 'rails_helper'

RSpec.describe 'the mtn_ranges show page' do
  before(:each) do
    @mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                                    natl_park_land: false,
                                    drivetime: 16)
    @mountain_1 = @mtn_range_1.mountains.create!(name: "Black Kaweah",
                                                  elevation: 13681,
                                                  safe_winter_route: false)
    @mountain_2 = @mtn_range_1.mountains.create!(name: "Black Kaweah",
                                                  elevation: 13681,
                                                  safe_winter_route: false)
    visit "/mtn_ranges/#{@mtn_range_1.id}"

  end

  it 'displays the mtn_range name' do
    expect(page).to have_content(@mtn_range_1.name)
  end

  it 'displays the drivetime' do
    expect(page).to have_content(@mtn_range_1.drivetime)
  end

  it 'displays whether it has natl park land' do
    expect(page).to have_content(@mtn_range_1.natl_park_land)
  end

  it 'displays count of mountains associated with ranges' do
    expect(page).to have_content("Mountain Count: 2")
  end

  it 'displays a link to delete the mtn range' do
    expect(page).to have_link("Delete #{@mtn_range_1.name}")
  end

  it "routes from deleting to index" do
    click_link("Delete #{@mtn_range_1.name}")
    expect(current_path).to eq("/mtn_ranges")
  end

  it "does not display delete records" do
    click_link("Delete #{@mtn_range_1.name}")
    expect(page).to_not have_content("#{@mtn_range_1.name}")
    expect(page).to_not have_content(@mountain_1.name)
    expect(page).to_not have_content(@mountain_2.name)

  end



end
