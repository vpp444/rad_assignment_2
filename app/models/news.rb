class News < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  default_scope -> {order(created_at: :desc)}
  validates :title, presence:true,length:{maximum: 200,minimum:10}
  validates :url,allow_blank: true ,format:{with: /(https?:\/\/).([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?/}
   
end
