class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|

      t.string :title
      t.text :content  # 내용

      t.boolean :public_check

      t.integer :user_id
      t.timestamps null: false
    end
  end
end
