require 'rails_helper'

RSpec.describe 'the mtn_ranges show page' do
  before(:each) do
    @mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                                    natl_park_land: false,
                                    drivetime: 16)
      visit "/mtn_ranges/#{@mtn_range_1.id}"

  end

  it 'displays the mtn_range name' do
    expect(page).to have_content(@mtn_range_1.name)
    save_and_open_page
  end

  it 'displays the drivetime' do
    expect(page).to have_content(@mtn_range_1.drivetime)
  end

  it 'displays whether it has natl park land' do
    expect(page).to have_content(@mtn_range_1.natl_park_land)
  end
end