class ParksController < ApplicationController
  def index
    if params[:sort]
      @parks = Park.all.by_count
    else
      @parks = Park.all
  end
  end

  def show
    @park = Park.find(params[:id])
  end

  def new
  end

  def create
    park = Park.new(park_params)
    park.save
    redirect_to "/parks"
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    @park.update(park_params)
    redirect_to "/parks/#{@park.id}"
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
    redirect_to '/parks'
  end

private
  def park_params
    params.permit(:name, :entrance_fee, :ocean_access)
  end
end
