class AddUserRefToSpots < ActiveRecord::Migration[6.0]
  def change
    add_reference :spots, :user, index: true, foreign_key: true
  end
end
