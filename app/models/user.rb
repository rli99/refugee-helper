class User < ActiveRecord::Base
    has_many :answers
    has_many :reports
    has_many :likes
  has_secure_password

end