class SpotsController < ApplicationController
  def new
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
