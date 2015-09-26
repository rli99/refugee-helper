class QuestionsController < ApplicationController
    @@Question_Counter = 0
    respond_to :html

    def new
        @question = Question.new
    end
    def create
        @question = Question.new(question_param)
        @question.ticket_id = @@Question_Counter
        @question.view = 0
        (@question.save) ?
            (   
                @@Question_Counter+=1
                respond_with(nil, location: root_path)) 
            :
            (render action: 'new')
        
    end
    def show
        @question = Question.find(params[:id]) 
        @question.view += 1
        @question.save
        @answer = Answer.new
        @answers = Answer.all
        
    end
    
    private
        def question_param
            params.require(:question).permit(:title, :category, :content)
        end
   
    
end