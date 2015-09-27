class AnswersController < ApplicationController
    before_action :authorize
    respond_to :html
   def create
        @answer = Answer.new(answer_params)
        @answer.user = User.find(session[:user_id])
        @answer.question = Question.find(params[:question_id])
        (@answer.save) ?
            (   
                flash[:success] = "Answer Posted."
                respond_with(nil, location: question_path(Question.find(params[:question_id])))) 
            :
                (
                    flash[:danger] = "An error occured. Failed to post the Answer to the Question."
                    respond_with(nil, location: question_path(Question.find(params[:question_id]))))
   end
   def report
       @answer = Answer.find(params[:answer_id])
       @answer.report += 1
       (@answer.report >= 1 || ((self.like-self.report) < -5)) ?
        (
            @answer.destroy
            redirect_to @answer.question) :
        (
       @report = Report.new
       @report.answer = @answer
       @report.user = User.find(session[:user_id])
       
       (@answer.save && @report.save) ?
        (
            flash[:success] = "Successfully Reported the Answer."
            redirect_to @answer.question )
        :
        (
            flash[:danger] = "An error occured. Could not report the Answer."
            redirect_to @answer.question )
        )
       
   end
   def like
       @answer = Answer.find(params[:answer_id])
       @answer.like += 1
       @like = Like.new
       @like.answer = @answer
       binding.pry
       @like.user = User.find(session[:user_id])
       
       (@answer.save && @like.save) ?
        (
            flash[:success] = "Successfully Liked the Answer."
            redirect_to @answer.question
            )
        :
        (
            flash[:success] = "An error occured. Could not like the Answer."
            redirect_to @answer.question )
       
   end  
   private
    def answer_params
       params.require(:answer).permit(:content, :question_id) 
    end
   
end