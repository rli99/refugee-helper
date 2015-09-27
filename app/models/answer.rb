class Answer < ActiveRecord::Base
    belongs_to :user
    belongs_to :question
    has_many :reports, dependent: :destroy
    has_many :likes, dependent: :destroy
    
    before_save :default_values
    def default_values
        self.report ||= 0
        self.like ||=0
    end
    
end