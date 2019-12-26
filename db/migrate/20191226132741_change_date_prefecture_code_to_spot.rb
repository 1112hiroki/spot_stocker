class ChangeDatePrefectureCodeToSpot < ActiveRecord::Migration[6.0]
  def change
    change_column :spots,  :prefecture_code, :string
  end
end
