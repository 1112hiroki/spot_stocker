class StocksController < ApplicationController
  def index
    # ログインユーザーがストックした記事一覧を取得
    stock_spots = Stock.get_stock_spots(current_user)
    # 取得した記事を10件毎にページネーションさせるためにpaginate_arrayメソッドを使う
    @stock_spots = Kaminari.paginate_array(stock_spots).page(params[:page]).per(10)
  end

  def create
    @spot = Spot.find(params[:spot_id])
    # 取得した記事がまだストックされていなければ
    unless @spot.stocked?(current_user)
      # ログインしているユーザーを取得してparamsで渡された記事をストック
      @spot.stock(current_user)
      # ajaxでストックボタンを実装
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @spot = Stock.find(params[:id]).spot
    # 取得した記事が既にストックされていれば
    if @spot.stocked?(current_user)
      # ログインしているユーザーを取得してparamsで渡された記事のストック解除
      @spot.unstock(current_user)
      # ajaxでストックボタンを実装
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end