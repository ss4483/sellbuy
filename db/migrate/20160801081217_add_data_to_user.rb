class AddDataToUser < ActiveRecord::Migration
  def change
    add_column :users, :kind, :string #셀러or 바이어
    add_column :users, :name, :string #이름
    add_column :users, :nickname, :string #닉네임
    add_column :users, :profile, :string #프로필 사진 주소
    add_column :users, :phone_num, :string #폰번호
    add_column :users, :gender, :string #성별
    add_column :users, :location, :string #지역
    add_column :users, :career, :string #참가경력
    add_column :users, :category, :string #판매제품
    add_column :users, :facebook_url, :string #페북
    add_column :users, :instar_url, :string #인스타
    add_column :users, :twitter_url, :string #트위터
    add_column :users, :blog_url, :string #블로그
  end
end
