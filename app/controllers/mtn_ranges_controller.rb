class MtnRangesController < ApplicationController
  def index
    @mtn_ranges = MtnRange.all
  end
end
