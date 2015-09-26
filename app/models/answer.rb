class Answer < ActiveRecord::Base
    belongs_to :users
    belongs_to :question
    has_many :reports
end