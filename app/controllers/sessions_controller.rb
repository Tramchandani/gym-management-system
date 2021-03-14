class SessionsController < ApplicationController
  def index;  end

  def logout
    reset_session
    flash[:notice] = "you have logged out!"
    redirect_to root_url
  end

  def login;  end

  def authenticate
    user = User.find_by_email(email_param)
    if user&.authenticate(password_param)
      session[:user_id] = user.id
      flash[:notice] = "successfully logged in!"
      redirect_to user_path(user.id)
    else
      flash[:notice] = "login failed!!!"
      redirect_to login_path
    end
  end

  private

  def email_param
    params.require(:email)
  end

  def password_param
    params.require(:password)
  end
end
