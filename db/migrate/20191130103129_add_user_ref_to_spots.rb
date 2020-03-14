class AddUserRefToSpots < ActiveRecord::Migration[6.0]
  def change
    add_reference :spots, :user, foreign_key: true
  end
end
