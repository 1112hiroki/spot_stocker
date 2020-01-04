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

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  def index
    if current_user
      @spot_count = Spot.where(user_id: current_user).count
      @likes_count = Like.where(spot: current_user.spots).count
  # ref https://qiita.com/MitsuguSueyoshi/items/18fa5e49a27e727f00b4
    # @ranking = Spot.find(Like.group(:spot_id).order('count(spot_id) desc').pluck(:spot_id))
    # spot_like_count = Spot.joins(:likes).group(:spot_id).count
  # ref https://qiita.com/tomoharutt/items/488beb4983b12484bbb6
    # spot_liked_ids = Hash[spot_like_count.sort_by{ |_, v| -v }].keys
    # @ranking = Spot.where(id: spot_liked_ids)
    # @ranking = Spot.joins(:)
    end
    if params[:q].present?
    # 検索フォームからアクセスした時の処理
      @search = Spot.ransack(params[:q])
      @spots = @search.result(distinct: true).page(params[:page]).per(10)
    else
    # 検索フォーム以外からアクセスした時の処理
      params[:q] = { sorts: 'id desc'}
      @search = Spot.ransack()
      @q = Spot.ransack(params[:q])
      @spots = @q.result(distinct: true).page(params[:page]).per(10)
    end
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
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to spots_url, notice: "投稿を更新しました"
    else
      render action: :edit
    end
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
    params.require(:spot).permit(:title, :content, :id, :spot_name, :review, :stay_time, :postcode, :prefecture_name, :address_city, :address_street, :address_building, :prefecture_id, :thumbnail)
  end

end