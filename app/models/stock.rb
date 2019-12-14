class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :user_id, presence: true
  validates :spot_id, presence: true

  def self.get_stock_spots(user)
    self.where(user_id: user.id).map(&:spot)
  end
end
