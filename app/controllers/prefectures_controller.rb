class PrefecturesController < ApplicationController
  def index
    @prefectures = Spot.where(prefecture_code: Prefecture.where(name: "東京都")).count
    # @prefectures = Prefecture.where(name: Spot.where(prefecture_code: "東京都")).count
  end
end
