class ParkHikesController < ApplicationController
  def index
    @park = Park.find(params[:park_id])
    @hikes = @park.hikes
  end

  def new
  end

  def create
    # park = Park.new({
    #   name: params[:name],
    #   entrance_fee: params[:entrance_fee],
    #   ocean_access: params[:ocean_access]
    #   })
    hike = Park.new(hike_params)
    park.save
    redirect_to "/parks"
  end

  private
    def hike_params
      params.permit(:name, :mileage, :elevation_gain, :water_on_route)
    end
end
