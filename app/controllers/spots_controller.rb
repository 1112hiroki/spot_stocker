class SpotsController < ApplicationController

  def new
    @spot = Spot.new
  end

  def post_params
    params.require(:spot).permit(:name, :content)
  end
end
