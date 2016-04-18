class User < ActiveRecord::Base
attr_accessor :name, :email

validates :name , presence: true
validates :email,presence: true 

#has_secure_password
end
