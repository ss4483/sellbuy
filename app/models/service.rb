class Service < ActiveRecord::Base
# 1(user):N(services)
  belongs_to :user
# 1(service):N(댓글)
  has_many :service_replies
end
