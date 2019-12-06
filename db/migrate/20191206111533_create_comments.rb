class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, index: true, null: false, foreign_key: true
      t.references :spot, index: true, null: false, foreign_key: true

      t.text :content, null: false

      t.timestamps
    end
  end
end
