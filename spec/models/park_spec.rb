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
    describe ':most_recent_first' do
      it 'shows the records ordered by most recently created first' do

        park_1 = Park.create!(name: "Rocky Mountain National Park",
                              entrance_fee: 50,
                              ocean_access: true)
        park_2 = Park.create!(name: "Glacier National Park",
                              entrance_fee: 30,
                              ocean_access: false)
        expect(Park.most_recent_first).to eq([park_2,park_1])
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
  end

end
