class User < ActiveRecord::Base 
    has_many :bullitins 
    has_secure_password
end