class PagesController < ApplicationController
   def home
       findFAQ
   end
   
   def career
      @questions = Question.where(category: "Job").paginate(:page => params[:page], :per_page => 5)
   end
    
   def health
      @questions = Question.where(category: "health").paginate(:page => params[:page], :per_page => 5)
   end
   
   def shelter
      @questions = Question.where(category: "shelter").paginate(:page => params[:page], :per_page => 5)
   end
   
   def food
      @questions = Question.where(category: "food").paginate(:page => params[:page], :per_page => 5)
   end
   
   def family
      @questions = Question.where(category: "family").paginate(:page => params[:page], :per_page => 5)
   end
   
   def findFAQ
      @questions = Question.all.order('view DESC').limit(10)
   end
   
end