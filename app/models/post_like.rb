class PostLike < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  
  validates :user_id, uniqueness: {scope: :post_id, message: "좋아요는 한번만!"}
end
