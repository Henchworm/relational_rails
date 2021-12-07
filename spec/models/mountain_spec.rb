require 'rails_helper'

describe Mountain do
  describe 'relationships' do
    it { should belong_to :mtn_range }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :elevation}
    it { should allow_value(false).for (:safe_winter_route) }
    it { should allow_value(true).for (:safe_winter_route) }
  end

end

