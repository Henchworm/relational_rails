class MtnRangesController < ApplicationController
  def index
    @mtn_ranges = MtnRange.all
  end

  def show
    @mtn_range = MtnRange.find(params[:id])
  end
end
