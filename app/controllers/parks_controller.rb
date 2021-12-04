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
    park = Park.new({
      name: params[:name],
      entrance_fee: params[:entrance_fee],
      ocean_access: params[:ocean_access]
      })
    park.save
    redirect_to "/parks"
  end
end
