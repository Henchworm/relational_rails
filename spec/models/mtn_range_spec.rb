require 'rails_helper'

describe MtnRange do

  describe 'relationships' do
    it { should have_many(:mountains) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    # it { should validate_presence_of(:natl_park_land) }
    it { should allow_value(false).for (:natl_park_land) }
    it { should allow_value(true).for (:natl_park_land) }

    it { should validate_presence_of(:drivetime) }
  end

  describe 'class methods' do
    describe ':most_recent_first' do
      it 'shows the records ordered by most recently created first' do

        mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                                      natl_park_land: false,
                                      drivetime: 16)
        mtn_range_2 = MtnRange.create!(name: "Rocky Mountains",
                                      natl_park_land: false,
                                      drivetime: 16)

        expect(MtnRange.most_recent_first).to eq([mtn_range_2, mtn_range_1])
      end
    end
  end
end