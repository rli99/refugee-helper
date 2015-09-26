class AnswersController < ApplicationController
    respond_to :html
   def create
        @answer = Answer.new(answer_params)
        @answer.user = User.first
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
       @report.user = User.first
       (@answer.save && @report.save) ?
        ( respond_with(nil, location: question_path(@answer.question)))
        :
        (respond_with(nil, location: question_path(@answer.question)))
       
   end
   
   private
    def answer_params
       params.require(:answer).permit(:content, :question_id) 
    end
   
end