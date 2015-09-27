class PagesController < ApplicationController
   def home
       findFAQ
   end
   
   def career
      @questions = Question.where(category: "Job").paginate(:page => params[:page], :per_page => 5)
   end
    
   def health
      @questions = Question.where(category: "Health").paginate(:page => params[:page], :per_page => 5)
   end
   
   def shelter
      @questions = Question.where(category: "Shelter").paginate(:page => params[:page], :per_page => 5)
   end
   
   def food
      @questions = Question.where(category: "Food").paginate(:page => params[:page], :per_page => 5)
   end
   
   def family
      @questions = Question.where(category: "Family").paginate(:page => params[:page], :per_page => 5)
   end
   
   def answered
      @questions = Question.joins(:answers).paginate(:page => params[:page], :per_page => 5)
   end
   
   def findFAQ
      @questions = Question.all.order('view DESC').limit(10)
   end
   
end