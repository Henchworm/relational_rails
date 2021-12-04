require 'rails_helper'

RSpec.describe "Park creation", type: :feature do

  it 'links to the new page from the parks index' do
    visit '/parks'

    click_link('New Park')
    expect(current_path).to eq('/parks/new')
  end

  it 'can create a new park' do
    visit '/parks/new'

    fill_in('name', with: 'Rocky Mountain National Park')
    fill_in('entrance_fee', with: 30)
    fill_in('ocean_access', with: false)

    click_button('Create Park')

    # new_park_id = Park.last.id
    expect(current_path).to eq("/parks")
    expect(page).to have_content("Rocky Mountain National Park")
  end
end
