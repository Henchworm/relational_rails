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
      it 'returns the records ordered by most recently created first' do

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

  describe 'instance methods' do
    describe 'mountain_count' do
      it 'returns the count of mountains associated with the mtn range' do
        mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                                      natl_park_land: false,
                                      drivetime: 16)
        mtn_range_2 = MtnRange.create!(name: "Sierra Nevada",
                                      natl_park_land: false,
                                      drivetime: 16)
        mountain_1 = mtn_range_1.mountains.create!(name: "Black Kaweah",
                                                    elevation: 13681,
                                                    safe_winter_route: false)
        mountain_2 = mtn_range_1.mountains.create!(name: "Red Kaweah",
                                                      elevation: 13720,
                                                      safe_winter_route: false)
        expect(mtn_range_1.mountain_count).to eq(2)
        expect(mtn_range_2.mountain_count).to eq(0)
      end

      describe '#elevation_threshold' do
        it 'returns mountains over a given number threshold' do
          mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                                        natl_park_land: false,
                                        drivetime: 16)
          mtn_range_2 = MtnRange.create!(name: "Sierra Nevada",
                                        natl_park_land: false,
                                        drivetime: 16)
          mountain_1 = mtn_range_1.mountains.create!(name: "Black Kaweah",
                                                      elevation: 13681,
                                                      safe_winter_route: false)
          mountain_2 = mtn_range_1.mountains.create!(name: "Red Kaweah",
                                                        elevation: 13720,
                                                        safe_winter_route: false)
          mountain_3 = mtn_range_1.mountains.create!(name: "Homers Nose",
                                                        elevation: 10000,
                                                        safe_winter_route: true)
          expect(mtn_range_1.elevation_threshold(13000)).to eq([mountain_1, mountain_2])
        end 
      end
    end
  end
end