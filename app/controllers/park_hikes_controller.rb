class ParkHikesController < ApplicationController
  def index
    @park = Park.find(params[:park_id])
    @hikes = @park.hikes
  end
end
