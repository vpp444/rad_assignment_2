class User < ActiveRecord::Base
    has_many :news
    has_many :comments
    has_secure_password
     validates :name, presence:true, length:{maximum: 15, minimum: 2},format:{with: /[a-z\d]+[-_]/},uniqueness: { case_sensitive: false }
     validates :password, presence:true, length:{minimum: 10},format:{with: /(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[-,.?:;'"!_=+]).{10,}/}
    
end
