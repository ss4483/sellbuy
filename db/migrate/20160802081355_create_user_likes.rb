class CreateUserLikes < ActiveRecord::Migration
  def change
    create_table :user_likes do |t|
      t.integer :user_id
      t.integer :favorite_id
      t.timestamps null: false
    end
  end
end
