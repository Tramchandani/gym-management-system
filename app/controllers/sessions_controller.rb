class SessionsController < ApplicationController
  def index;  end

  def logout
    reset_session
    flash[:notice] = "you have logged out!"
    redirect_to root_url
  end

  def login;  end

  def authenticate
    user = User.find_by_email(session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:notice] = "login failed!!!"
      redirect_to login_path
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
