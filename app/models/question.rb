class Question < ActiveRecord::Base
    has_many :answers
    has_many :reports

end