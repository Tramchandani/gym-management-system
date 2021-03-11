class SessionsController < ApplicationController
  def logout
    reset_session
    redirect_to :action => 'index', :controller=>"users", notice: "you have logged out!"
    #byebug
  end

  def login;  end

  def authenticate
    user = User.find_by_email(params.require(:email))
    if user&.authenticate(params[:password])  
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: "successfully logged in!"
    else
      redirect_to :action => 'index', :controller=>"users", notice: "login failed!!!"
      #byebug
    end
  end
end
