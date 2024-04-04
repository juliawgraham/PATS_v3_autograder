class SessionsController < ApplicationController
    def new
    end
    
    def create
      owner = Owner.authenticate(params[:username], params[:password])
      if owner
        session[:user_id] = owner.id
        redirect_to home_path, notice: "Logged in!"
      else
        flash.now.alert = "Username and/or password is invalid"
        render "new"
      end
    end
    
    def destroy
      session[:user_id] = nil
      redirect_to home_path, notice: "Logged out!"
    end
  end