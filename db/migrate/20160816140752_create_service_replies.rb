class CreateServiceReplies < ActiveRecord::Migration
  def change
    create_table :service_replies do |t|
      t.string :content

      t.integer :service_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
