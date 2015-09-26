class Answer < ActiveRecord::Base
    belongs_to :user
    belongs_to :question
    has_many :reports
    has_many :likes
    
    before_save :default_values
    def default_values
        self.report ||= 0
        self.like ||=0
    end
end