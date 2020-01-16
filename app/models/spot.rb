class Spot < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode
  # belongs_to :prefecture
  has_many :comments, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :stock_users, through: :stocks, source: :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates :title, presence: true
  validates :user_id, presence: true
  validates :spot_name, presence: true
  validates :stay_time, presence: true
  validates :postcode, presence: true, format: {with:/\A\d{7}\z/,message: "に誤りがあります"}
  validates :prefecture_code, presence: true

  validates :content, presence: true
  mount_uploader :thumbnail, ThumbnailUploader

  enum stay_time: { １時間以内: 1, １〜２時間: 2, ２〜３時間: 3, ３時間以上: 4}
  default_scope -> { order(created_at: :desc) }
  has_rich_text :content

  # geocoderのメソッド
  def address
    [address_city,address_street].compact.join(',')
  end

  # 住所自動入力に必要なコード
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name)&.code
  end

  # 現在ログインしているユーザーidを受け取り、記事をストックする
  def stock(user)
    stocks.create(user_id: user.id)
  end

  # 現在ログインしているユーザーidを受け取り、記事のストックを解除する
  def unstock(user)
    stocks.find_by(user_id: user.id).destroy
  end

  # 記事がストック済みであるかを判定。取得済みであれば true を返す
  def stocked?(user)
    stock_users.include?(user)
  end

  # 現在ログインしているユーザーidを受け取り、記事をライクする
  def like(user)
    likes.create(user_id: user.id)
  end

  # 現在ログインしているユーザーidを受け取り、記事のライクを解除する
  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end

  # 記事がライク済みであるかを判定。取得済みであれば true を返す
  def liked?(user)
    like_users.include?(user)
  end

  ransacker :likes_count do
    query = '(SELECT COUNT(likes.spot_id) FROM likes where likes.spot_id = spots.id GROUP BY likes.spot_id)'
    Arel.sql(query)
  end
end
