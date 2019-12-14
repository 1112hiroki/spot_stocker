class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.references :user, index: true, null: false, foreign_key: true
      t.references :spot, index: true, null: false, foreign_key: true

      t.timestamps

      t.index [:user_id, :spot_id], unique: true
    end
  end
end
