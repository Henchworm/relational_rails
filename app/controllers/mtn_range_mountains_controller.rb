class MtnRangeMountainsController < ApplicationController
  def index
    @mtn_range = MtnRange.find(params[:mtn_range_id])
    if params[:num]
      @mountains = @mtn_range.elevation_threshold(params[:num])
    else
    @mountains = @mtn_range.mountains
    end
  end

  def new
    @mtn_range = MtnRange.find(params[:mtn_range_id])
  end

  def create
    @mtn_range = MtnRange.find(params[:mtn_range_id])
    @mountain = @mtn_range.mountains.create!(({name: params[:name],
                                              elevation: params[:elevation],
                                              safe_winter_route: params[:safe_winter_route]}))
    @mountain.save
    redirect_to "/mtn_ranges/#{@mtn_range.id}/mountains"
  end
end