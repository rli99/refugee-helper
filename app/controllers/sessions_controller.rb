class SessionsController < ApplicationController

   def new
   end
   
   def create
        params[:session][:name]
        user = User.find_by(name: params[:session]["user"])
        # If the user exists AND the password entered is correct.
        if user && user.authenticate(params[:session][:password])
            # Save the user id inside the browser cookie. This is how we keep the user 
            # logged in when they navigate around our website.
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in."
            redirect_to '/'
        else
            # If user's login doesn't work, send them back to the login form.
            flash[:danger] = "Login attempted failed."
            redirect_to '/login'
        end
   end
   
   def destroy
        session[:user_id] = nil
        flash[:success] = "You have successfully logged out."
        redirect_to '/login'
   end
    
end