class SessionsController < ApplicationController

    def new
    end

    def create
            entered_email = params["email"]
            entered_password = params["password"]
            @user = User.find_by({email: entered_email})
            #checking that email matches
            if @user 
                if BCrypt::Password.new(@user.password) == entered_password
                    session["user_id"] = @user.id
                    flash[:notice] == "Welcome!"
                    redirect_to "/companies"
                else  
                flash[:notice] == "Password is incorrect"
                redirect_to "/sessions/new"  
                end 
            else
            flash[:notice] == "No user with that email address"
            redirect_to "/sessions/new"
            end
    end

end
