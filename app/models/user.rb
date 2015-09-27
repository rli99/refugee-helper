class User < ActiveRecord::Base
    has_many :answers, dependent: :destroy
    has_many :reports, dependent: :destroy
    has_many :likes, dependent: :destroy
  has_secure_password

end