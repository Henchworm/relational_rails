require 'rails_helper'

describe Mountain do
  describe 'relationships' do
    it { should belong_to :mtn_range }
  end
end