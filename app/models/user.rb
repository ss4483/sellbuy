class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :profile, SellbuyUploader
# 1(user):N(포스트)
  has_many :posts
# 1(user):N(댓글)
  has_many :post_replies
# post 좋아요 N(user):M(포스트)
  has_many :post_likes
  has_many :posts, through: :post_likes
# user 즐겨찾기
  has_and_belongs_to_many :favorites, class_name: "User",
                               join_table: "user_likes",
                               association_foreign_key: "favorite_id"
end
