class ChangeColumnToSpot < ActiveRecord::Migration[6.0]
  def change
    change_column :spots,  :prefecture_code, :integer
  end
end
