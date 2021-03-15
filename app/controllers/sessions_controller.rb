class SessionsController < ApplicationController
  def index;  end

  def logout
    reset_session
    flash[:notice] = "you have logged out!"
    redirect_to root_url
  end

  def login;  end

  def authenticate
    user = User.find_by_email(attr_param('email'))
    if user&.authenticate(attr_param('password'))
      session[:user_id] = user.id
      flash[:notice] = "successfully logged in!"
      redirect_to user_path(user.id)
    else
      flash[:notice] = "login failed!!!"
      redirect_to login_path
    end
  end

  private

  def attr_param(attr)
    params.require(attr)
  end
end
