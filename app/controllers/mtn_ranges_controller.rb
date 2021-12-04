class MtnRangesController < ApplicationController
  def index
    @mtn_ranges = MtnRange.all
  end

  def show
    @mtn_range = MtnRange.find(params[:id])
  end

  def new
  end

  def create
    @mtn_range = MtnRange.new({name: params[:name],
                               drivetime: params[:drivetime],
                               natl_park_land: params[:natl_park_land]
    })
    @mtn_range.save
    redirect_to "/mtn_ranges/"
  end
end
