require 'rails_helper'

describe Park do

  describe 'relationships' do
    it { should have_many(:hikes) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :entrance_fee }
    it { should allow_value(false).for (:ocean_access) }
    it { should allow_value(true).for (:ocean_access) }
  end

  describe 'class methods' do
    describe '::most_recent_first' do
      it 'shows the records ordered by most recently created first' do

        park_1 = Park.create!(name: "Rocky Mountain National Park",
                              entrance_fee: 50,
                              ocean_access: true)
        park_2 = Park.create!(name: "Glacier National Park",
                              entrance_fee: 30,
                              ocean_access: false)
        expect(Park.most_recent_first).to eq([park_2, park_1])
      end
    end

    describe '::by_count' do
      it 'orders all parks by number of hikes, greatest to least' do
        park_1 = Park.create!(name: "Rocky Mountain National Park",
                              entrance_fee: 50,
                              ocean_access: true)
        park_2 = Park.create!(name: "Glacier National Park",
                              entrance_fee: 50,
                              ocean_access: true)
        hike_1 = park_1.hikes.create!(name: "Sky Pond",
                                      mileage: 12,
                                      elevation_gain: 1600,
                                      water_on_route: true)
        hike_2 = park_1.hikes.create!(name: "Moomaw Glacier",
                                      mileage: 20,
                                      elevation_gain: 4000,
                                      water_on_route: true)
        hike_3 = park_2.hikes.create!(name: "Grinell Glacier",
                                      mileage: 9,
                                      elevation_gain: 2000,
                                      water_on_route: true)

      expect(Park.by_count).to eq([park_1, park_2])
      end
    end
  end

  describe 'instance methods' do
    describe '#hike_count' do
      it 'returns the count of hikes associated with the given park' do
        park_1 = Park.create!(name: "Rocky Mountain National Park",
                              entrance_fee: 50,
                              ocean_access: true)
        park_2 = Park.create!(name: "Glacier National Park",
                              entrance_fee: 50,
                              ocean_access: true)
        hike_1 = park_1.hikes.create!(name: "Sky Pond",
                                      mileage: 12,
                                      elevation_gain: 1600,
                                      water_on_route: true)
        hike_2 = park_1.hikes.create!(name: "Moomaw Glacier",
                                      mileage: 20,
                                      elevation_gain: 4000,
                                      water_on_route: true)
        expect(park_1.hike_count).to eq(2)
        expect(park_2.hike_count).to eq(0)
      end
    end

    describe '#hikes_by_name' do
      it 'returns Hikes ordered by name alphabetically' do
        park_1 = Park.create!(name: "Rocky Mountain National Park",
                              entrance_fee: 50,
                              ocean_access: true)
        park_2 = Park.create!(name: "Glacier National Park",
                              entrance_fee: 50,
                              ocean_access: true)
        hike_1 = park_1.hikes.create!(name: "Sky Pond",
                                      mileage: 12,
                                      elevation_gain: 1600,
                                      water_on_route: true)
        hike_2 = park_1.hikes.create!(name: "Moomaw Glacier",
                                      mileage: 20,
                                      elevation_gain: 4000,
                                      water_on_route: true)
        hike_3 = park_1.hikes.create!(name: "Mt. Ypsilon",
                                      mileage: 9,
                                      elevation_gain: 4000,
                                      water_on_route: false)

        expect(park_1.hikes_by_name).to eq([hike_2, hike_3, hike_1])
      end
    end

    describe '#mileage_threshold' do
      it 'returns hikes over a given number threshold' do
        park_1 = Park.create!(name: "Rocky Mountain National Park",
                              entrance_fee: 50,
                              ocean_access: true)
        park_2 = Park.create!(name: "Glacier National Park",
                              entrance_fee: 50,
                              ocean_access: true)
        hike_1 = park_1.hikes.create!(name: "Sky Pond",
                                      mileage: 12,
                                      elevation_gain: 1600,
                                      water_on_route: true)
        hike_2 = park_1.hikes.create!(name: "Moomaw Glacier",
                                      mileage: 20,
                                      elevation_gain: 4000,
                                      water_on_route: true)
        hike_3 = park_1.hikes.create!(name: "Mt. Ypsilon",
                                      mileage: 9,
                                      elevation_gain: 4000,
                                      water_on_route: false)

        expect(park_1.mileage_threshold(15)).to eq([hike_2])
    end
  end
end
end
