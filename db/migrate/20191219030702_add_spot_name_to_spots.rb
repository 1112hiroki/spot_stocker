class AddSpotNameToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :spot_name, :string
  end
end
