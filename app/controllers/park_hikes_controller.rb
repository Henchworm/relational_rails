class ParkHikesController < ApplicationController
  def index
    @park = Park.find(params[:park_id])
    if params[:sort]
      @hikes = @park.hikes_by_name
    elsif params[:number]
      @hikes = @park.mileage_threshold(params[:number])
    else
      @hikes = @park.hikes
    end
  end

  def new
    @park = Park.find(params[:park_id])
  end

  def create
    @park = Park.find(params[:park_id])
    @hike = @park.hikes.create!(hike_params)
    @hike.save
    redirect_to "/parks/#{@park.id}/hikes"
  end

  private
    def hike_params
      params.permit(:name, :mileage, :elevation_gain, :water_on_route)
    end
end
