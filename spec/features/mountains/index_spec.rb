require 'rails_helper'

RSpec.describe "the mountain index page", type: :feature do
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

      visit "/mountains"
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

      it 'show link to edit mountain' do
        expect(page).to have_link("Edit Black Kaweah")
        expect(page).to have_link("Edit Red Kaweah")
      end

      it 'can route to mountain edit page' do
        click_link("Edit Black Kaweah")
        expect(current_path).to eq("/mountains/#{@mountain_1.id}/edit")
      end

      it 'show link to delete each mountain' do
        expect(page).to have_link("Delete Black Kaweah")
        expect(page).to have_link("Delete Red Kaweah")
      end

      it 'can link to delete a mountain range next to each mountain range' do
        click_link("Delete Black Kaweah")
        expect(current_path).to eq("/mountains")
        expect(page).to_not have_content("#{@mountain_1.name}")
        expect(page).to have_content("#{@mountain_2.name}")
      end

    end
