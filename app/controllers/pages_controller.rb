class PagesController < ApplicationController
   def home
       findFAQ
   end
    
   def health
      @questions = Question.paginate(:page => params[:page], :per_page => 5)
   end
   
   def shelter
      @questions = Question.paginate(:page => params[:page], :per_page => 5)
   end
   
   def food
      @questions = Question.where(category: "food")
      @questions = Question.paginate(:page => params[:page], :per_page => 5)
      
   end
   
   def family
      @questions = Question.paginate(:page => params[:page], :per_page => 5)
      Question.where(category: "family")
   end
   
   def findFAQ
      @questions = Question.all.order('view DESC').limit(10)
   end
   
end