class Spot < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
end
