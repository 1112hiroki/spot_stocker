class Spot < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :stock_users, through: :stocks, source: :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates :title, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  has_rich_text :content

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
end
