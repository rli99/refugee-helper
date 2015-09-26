class AnswersController < ApplicationController
    respond_to :html
   def create
        @answer = Answer.new(answer_params)
        @answer.user = User.first
        @answer.question = Question.find(params[:question_id])
        (@answer.save) ?
            (   
                respond_with(nil, location: questions_path)) 
            :
                (respond_with(nil, location: questions_path(Question.find(params[:question]))))
   end
   
   private
    def answer_params
       params.require(:answer).permit(:content, :question_id) 
    end
   
end