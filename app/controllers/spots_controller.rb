class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    if @spot.save
      redirect_to spots_url, notice: "スポットの投稿が完了しました"
    else
      render action: :new
    end
  end

  def index
    # spots = Spot.all
    # @spots = Kaminari.paginate_array(spots).page(params[:page]).per(10)
    @q = Spot.ransack(params[:q])
    @spots = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    @spot = Spot.find(params[:id])
    @comment = @spot.comments.build
    @likes_count = Like.where(spot_id: @spot.id).count
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    spot = Spot.find(params[:id])
    spot.update!(spot_params)
    redirect_to spots_url, notice: "投稿を更新しました"
  end

  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to spots_url, notice: "投稿を削除しました"
  end

  def zipedit
    params.require(:spot).permit(:postcode, :prefecture_name, :address_city, :address_street, :address_building)
  end

  private

  def spot_params
    params.require(:spot).permit(:title, :content, :id, :spot_name, :review, :stay_time, :postcode, :prefecture_code, :address_city, :address_street, :address_building)
  end
end