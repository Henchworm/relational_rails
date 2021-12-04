class ParksController < ApplicationController
  def index
    @parks = Park.all
  end

  def show
    @park = Park.find(params[:id])
  end

  def new
  end

  def create
    # park = Park.new({
    #   name: params[:name],
    #   entrance_fee: params[:entrance_fee],
    #   ocean_access: params[:ocean_access]
    #   })
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

private
  def park_params
    params.permit(:name, :entrance_fee, :ocean_access)
  end
end
