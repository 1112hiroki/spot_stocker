class AddThumbnailToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :thumbnail, :string
  end
end
