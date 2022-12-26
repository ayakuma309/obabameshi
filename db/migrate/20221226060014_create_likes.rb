class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.string :type, null: false
      t.timestamps
    end
    add_index :likes, [:user_id, :item_id], unique: true
  end
end
