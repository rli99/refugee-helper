class PagesController < ApplicationController
   def home
       findFAQ
   end
    
   def health
       
   end
   
   def shelter
      
   end
   
   def food
      
   end
   
   def family
      
   end
   
   def findFAQ
      @questions = Question.all.order('view DESC').limit(10)
   end
end