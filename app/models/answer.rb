class Answer < ActiveRecord::Base
    belongs_to :users
    belongs_to :question
end