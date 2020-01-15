class Like < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :user_id, uniqueness: { scope: :spot_id }

  def self.get_stock_spots(user)
    self.where(user: user).map(&:spot)
  end
end