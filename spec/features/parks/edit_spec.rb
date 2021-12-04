require 'rails_helper'

RSpec.describe 'edit Park' do
  it 'links to the edit page' do
    park = Park.create!(name: "Rocky Mountain National Park", entrance_fee: 30, ocean_access: false)
    visit "/parks/#{park.id}"

    click_link "Update #{park.name}"
    expect(current_path).to eq("/parks/#{park.id}/edit")
  end

  it 'can edit the Park' do
    park = Park.create!(name: "Rocky Mountain National Park", entrance_fee: 30, ocean_access: false)
    visit "/parks/#{park.id}/edit"

    fill_in('name', with: 'Rocky Mountain National Park')
    fill_in('entrance_fee', with: 20)
    fill_in('ocean_access', with: false)

    click_button 'Update Park'

    expect(current_path).to eq("/parks/#{park.id}")
    expect(page).to have_content(20)
  end

  end
