class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]

  def new
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
