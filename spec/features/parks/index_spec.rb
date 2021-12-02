require 'rails_helper'

RSpec.describe "parks index page", type: :feature do
  it 'can see all park names' do
    park_1 = Park.create!(name: "Rocky Mountain National Park",
                          entrance_fee: 50,
                          ocean_access: true)
    visit "/parks"

    expect(page).to have_content(park_1.name)
  end
end
