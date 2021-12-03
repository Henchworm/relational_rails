require 'rails_helper'

RSpec.describe 'welcome_index' do
    before(:each) do
      visit "/"
    end

    it 'displays welcome' do
      expect(page).to have_content("Welcome to the GREAT OUTDOORS")
    end 


    it 'displays mountain ranges and link' do
      expect(page).to have_link("Mountain Ranges")
      #need to test href
    end

    it "displays mountains and link" do
      expect(page).to have_link("Mountains")
    end

    it "displays natl parks and link" do
      expect(page).to have_link("Natl Parks")
    end

    it "displays hikes and link" do
      expect(page).to have_link("Hikes")
    end
  end
