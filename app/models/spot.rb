class Spot < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  has_rich_text :content
end
