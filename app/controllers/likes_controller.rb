class LikesController < ApplicationController
  def index
    # ログインユーザーがストックした記事一覧を取得
    like_spots = Like.get_like_spots(current_user)
    # 取得した記事を10件毎にページネーションさせるためにpaginate_arrayメソッドを使う
    @like_spots = Kaminari.paginate_array(like_spots).page(params[:page]).per(10)
  end

  def create
    @spot = Spot.find(params[:spot_id])
    # 取得した記事がまだストックされていなければ
    unless @spot.liked?(current_user)
      # ログインしているユーザーを取得してparamsで渡された記事をストック
      @spot.like(current_user)
      # ajaxでストックボタンを実装
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @spot = Like.find(params[:id]).spot
    # 取得した記事が既にストックされていれば
    if @spot.liked?(current_user)
      # ログインしているユーザーを取得してparamsで渡された記事のストック解除
      @spot.unlike(current_user)
      # ajaxでストックボタンを実装
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end