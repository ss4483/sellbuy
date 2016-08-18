class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :profile, SellbuyUploader
# 1(user):N(포스트)
  has_many :posts
#  1(user):N(1:1문의)
  has_many :services
# 1(user):N(댓글)
  has_many :post_replies
# 1(user):N(service_댓글)
  has_many :service_replies
# post 좋아요 N(user):M(포스트)
  has_many :post_likes
  has_many :posts, through: :post_likes
# user 즐겨찾기
  has_and_belongs_to_many :favorites, class_name: "User",
                               join_table: "user_likes",
                               association_foreign_key: "favorite_id"
end
