require 'rails_helper'

describe Hike do
  describe 'relationships' do
    it { should belong_to(:park) }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :mileage}
    it { should validate_presence_of :elevation_gain}
    it { should allow_value(false).for (:water_on_route) }
    it { should allow_value(true).for (:water_on_route) }
  end

  describe 'Class Methods' do
    describe '::true_only' do
      it 'lists only hikes where there is water_on_route (boolean == true)' do
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
        expect(park_1.hikes.true_only).to eq([hike_1, hike_2])
      end
    end
  end
end
