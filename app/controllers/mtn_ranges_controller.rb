class MtnRangesController < ApplicationController
  def index
    if params[:sort]
      @mtn_ranges = MtnRange.all.by_count
    else
      @mtn_ranges = MtnRange.all
    end
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

  def edit
    @mtn_range = MtnRange.find(params[:id])
  end

  def update
      @mtn_range = MtnRange.find(params[:id])
      @mtn_range.update(({name: params[:name],
                                 drivetime: params[:drivetime],
                                 natl_park_land: params[:natl_park_land]
      }))
      redirect_to "/mtn_ranges/#{@mtn_range.id}"
  end

  def destroy
    @mtn_range = MtnRange.find(params[:id])
    @mtn_range.destroy
    redirect_to "/mtn_ranges"
  end
end
