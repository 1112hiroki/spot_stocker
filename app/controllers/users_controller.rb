class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name,:email,:profile,:image,:password,:password_confirmation)
    end
end
