class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :news
  validates :body, presence:true,length:{maximum: 1000, minimum: 3},format:{with: /\S{3,}/}
  default_scope -> {order(created_at: :desc)}
end
