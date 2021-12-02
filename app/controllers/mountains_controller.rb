class MountainsController < ApplicationController
  def index
    @mountains = Mountain.all
  end

  # def show
  #   @mtn_range = MtnRange.find(params[:id])
  # end
end
