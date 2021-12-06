class MountainsController < ApplicationController
  def index
    @mountains = Mountain.all
  end

  def show
    @mountain = Mountain.find(params[:id])
  end

  def edit
    @mountain = Mountain.find(params[:id])
  end

  def update
    @mountain = Mountain.find(params[:id])
    @mountain.update(name: params[:name], elevation: params[:elevation], safe_winter_route: params[:safe_winter_route])
    redirect_to "/mountains/#{@mountain.id}"
  end


end
