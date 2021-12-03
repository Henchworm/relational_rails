class MtnRangeMountainsController < ApplicationController
  def index
    @mtn_range = MtnRange.find(params[:mtn_range_id])
    @mountains = @mtn_range.mountains
  end
end