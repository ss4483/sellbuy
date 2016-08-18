class Post < ActiveRecord::Base
# 1(user):N(post)
  belongs_to :user
# 1:N(댓글)
  has_many :post_replies
# post 좋아요 M(포스트):N(user)
  has_many :post_likes
  has_many :users, through: :post_likes

end
