require 'rails_helper'

RSpec.describe "the mountain index page", type: :feature do
    before(:each) do
      @mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                                    natl_park_land: false,
                                    drivetime: 16)
      @mountain_1 = @mtn_range_1.mountains.create!(name: "Black Kaweah",
                                                 elevation: 13681,
                                                 safe_winter_route: false)

      visit "/mountains"
    end

      it "displays the mountain name" do
        expect(page).to have_content(@mountain_1.name)
      end

      it "displays the mountain elevation" do
        expect(page).to have_content(@mountain_1.elevation)
      end

      it "displays whether or not there is a safe winter route" do
        expect(page).to have_content(@mountain_1.safe_winter_route)
        save_and_open_page 
      end
    end
