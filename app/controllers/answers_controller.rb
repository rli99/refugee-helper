class AnswersController < ApplicationController
    before_action :authorize
    respond_to :html
   def create
        @answer = Answer.new(answer_params)
        @answer.user = User.find(session[:user_id])
        @answer.question = Question.find(params[:question_id])
        (@answer.save) ?
            (   
                respond_with(nil, location: question_path(Question.find(params[:question_id])))) 
            :
                (respond_with(nil, location: question_path(Question.find(params[:question_id]))))
   end
   def report
       @answer = Answer.find(params[:answer_id])
       @answer.report += 1
       @report = Report.new
       @report.answer = @answer
       @report.user = User.find(session[:user_id])
       (@answer.save && @report.save) ?
        (redirect_to @answer.question )
        :
        (redirect_to @answer.question )
       
   end
   def like
       @answer = Answer.find(params[:answer_id])
       @answer.like += 1
       @like = Like.new
       @like.answer = @answer
       binding.pry
       @like.user = User.find(session[:user_id])
       
       (@answer.save && @like.save) ?
        (redirect_to @answer.question )
        :
        (redirect_to @answer.question )
       
   end  
   private
    def answer_params
       params.require(:answer).permit(:content, :question_id) 
    end
   
end