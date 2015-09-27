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

       @report = Report.new
       @report.answer = @answer
       @report.user = User.find(session[:user_id])
       
       (@answer.save && @report.save) ?
        (
            @answer.report += 1
            (@answer.report >= 1 || ((self.like-self.report) < -5)) ?
                ( @answer.destroy
                    redirect_to @answer.question) :
            (flash[:success] = "Successfully Reported the Answer."
            redirect_to @answer.question ))
        :
        (
            flash[:danger] = "You already liked that!"
            redirect_to @answer.question )
        
       
   end
   
   def unreport
       
   end
   def like
       @answer = Answer.find(params[:answer_id])
       
       @like = Like.new
       @like.answer = @answer
       @like.user = User.find(session[:user_id])
       
       (@like.save) ?
        (
            @answer.like += 1
            @answer.save
            flash[:success] = "Successfully Liked the Answer."
            redirect_to @answer.question
            )
        :
        (
            flash[:danger] = "An error occured. Could not like the Answer."
            redirect_to @answer.question )
       
   end  
   def unlike
       
   end
   private
    def answer_params
       params.require(:answer).permit(:content, :question_id) 
    end
   
end