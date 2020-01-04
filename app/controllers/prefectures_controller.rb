class PrefecturesController < ApplicationController
  def index
    @prefecture_tokyo = Spot.where(prefecture_code: 13).count
    @prefectures = Spot.group(:prefecture_code).count
  end

  def show
    if current_user
      @spot_count = Spot.where(user_id: current_user).count
      @likes_count = Like.where(spot: current_user.spots).count
    end
      if params[:q].present?
    # 検索フォームからアクセスした時の処理
      @search = Spot.ransack(params[:q])
      @spots = @search.result(distinct: true).page(params[:page]).per(10)
    else
    # 検索フォーム以外からアクセスした時の処理
      # params[:q] = { sorts: 'id desc'}
      # @search = Spot.ransack()
      # @q = Spot.ransack(params[:q])
      # @spots = @q.result(distinct: true).page(params[:page]).per(10)

      @spot = Spot.find(params[:id])
      @spots = Spot.where(prefecture_code: @spot)
      # @prefecture_name = @spots.prefecture_code
      # binding.pry
    end
  end
end
