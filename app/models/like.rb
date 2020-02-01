class Like < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :user_id, uniqueness: { scope: :spot_id }

  def self.get_stock_spots(user)
    self.where(user_id: user.id).map(&:spot)
  end

  def self.get_stock_likes(user)
    @likes_count = self.where(spot_id: spot.id).count
  end
end