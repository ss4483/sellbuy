class PostReply < ActiveRecord::Base
  validates :content, presence: true
# 1(user):N(댓글)
  belongs_to :user
# 1(post):N(댓글)
  belongs_to :post
end
