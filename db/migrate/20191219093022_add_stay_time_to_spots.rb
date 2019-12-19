class AddStayTimeToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :stay_time, :integer
  end
end
