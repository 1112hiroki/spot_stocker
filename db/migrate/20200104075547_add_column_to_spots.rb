class AddColumnToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :latitude, :float
    add_column :spots, :longitude, :float
  end
end
