
RSpec.describe 'mtn_range new page' do


it "routes to /mtn_ranges/:id/edit" do
  mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                                  natl_park_land: false,
                                  drivetime: 16)
  visit "/mtn_ranges/#{mtn_range_1.id}/"

  click_link "Update #{mtn_range_1.name}"

  expect(current_path).to eq("/mtn_ranges/#{mtn_range_1.id}/edit")

  end

  it "can create a new mtn_range" do
    mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                                    natl_park_land: false,
                                    drivetime: 16)
    visit "/mtn_ranges/#{mtn_range_1.id}/edit"

    expect(current_path).to eq("/mtn_ranges/#{mtn_range_1.id}/edit")

    fill_in('name', with: 'Rocky Mountains')
    fill_in('drivetime', with: 10)
    fill_in('natl_park_land', with: true)

    click_button('Update Mountain Range')

    expect(current_path).to eq("/mtn_ranges/#{mtn_range_1.id}")
    expect(page).to have_content("Rocky Mountains")
  end

end