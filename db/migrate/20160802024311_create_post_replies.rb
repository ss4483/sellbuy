class CreatePostReplies < ActiveRecord::Migration
  def change
    create_table :post_replies do |t|
      t.string :title
      t.string :content

      t.integer :post_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
