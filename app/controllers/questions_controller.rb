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
                respond_with(nil, location: confirmation_path(ticket: @question.ticket_id))
            ) 
            :
            (
                flash[:danger] = "An error occured. Failed to post the question."
                render action: 'new')
    end
    
    
    def show
        @question = Question.find(params[:id]) 
        @question.view += 1
        @question.save
        @answer = Answer.new
        @answers = @question.answers.order(like: :DESC)
        
    end
    
    def showticket
        @ticket = params[:ticket]
    end
    private
        def question_param
            params.require(:question).permit(:title, :category, :content)
        end
   
    
end