
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record

# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'

RSpec.describe 'mtn_range new page' do

  #expect what the form looks like to have content
  #is this living in the right place: we think so 
  it "can create a new mtn_range" do
    visit '/mtn_ranges/new'
    expect(current_path).to eq('/mtn_ranges/new')

    fill_in('name', with: 'Sierra Nevada')
    fill_in('drivetime', with: 16)
    fill_in('natl_park_land', with: false)

    click_button('Create Mountain Range')

    new_mtn_range_id = MtnRange.last.id
    expect(current_path).to eq("/mtn_ranges/")
    expect(page).to have_content("Sierra Nevada")
  end
end