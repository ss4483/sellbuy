class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.text :kind #글종류
      t.boolean :index_check, default: true # index에 글나타낼지 말지
      t.text :content  # 내용
      t.string :image_url,    default: ""  # 이미지

      # market참가 항목
      t.datetime :term_end
      t.string :banner

      # epilogue 항목
      t.integer :other_user
      t.string :rating 

      t.integer :user_id

      t.timestamps null: false
    end
  end
end
