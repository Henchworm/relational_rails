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
        expect(Park.most_recent_first.first).to eq(park_2)
      end
    end
  end
end
