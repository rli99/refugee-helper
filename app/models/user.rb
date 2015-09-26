class User < ActiveRecord::Base
    has_many :answers
    has_many :questions
    has_many :reports
  has_secure_password

end