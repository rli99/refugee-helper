class QuestionController < ApplicationController
    
    

    def findFAQ
        @questions = Question.all.order(:view)
    end
end