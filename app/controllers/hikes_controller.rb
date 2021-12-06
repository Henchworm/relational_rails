class HikesController < ApplicationController
  def index
    @hikes = Hike.all
  end

  def show
    @hike = Hike.find(params[:id])
  end

  def edit
    @hike = Hike.find(params[:id])
  end

  def update
    hike = Hike.find(params[:id])
    hike.update(hike_params)
    redirect_to "/hikes/#{hike.id}"
  end

  def destroy
    hike = Hike.find(params[:id])
    hike.destroy
    redirect_to '/hikes'
  end

  private
    def hike_params
      params.permit(:name, :mileage, :elevation_gain, :water_on_route)
    end
end
