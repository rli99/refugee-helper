class UsersController < ApplicationController
    
    def new
    end
    
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            flash[:success] = "You have succesfully registered."
            redirect_to '/'
        else
            flash[:danger] = "Registration failed."
            redirect_to '/signup'
        end
    end
    
    def profile
        @user = User.find(session[:user_id])
    end
    
    def update
        user = User.find(session[:user_id])
        user.update(user_params)
        if user.save
            flash[:success] = "You have succesfully updated your profile."
            redirect_to '/profile'
        else
            flash[:danger] = "Profile update failed."
            redirect_to '/profile'
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :nationality, :dob, :password, :password_confirmation) 
    end
     
end