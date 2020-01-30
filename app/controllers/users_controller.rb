class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    spots = Spot.where(user_id: @user.id)
    @spots = spots.page(params[:page]).per(10)
    @likes_count = Like.where(spot: @user.spots).count
  end

  private

    def user_params
      params.require(:user).permit(:name,:email,:profile,:image,:password,:password_confirmation)
    end
end