class UsersController < ApplicationController
  def index
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.create(signup_params) 
    session[:user_id] = @user.id
    if @user.save 
      redirect_to user_path(@user.id)
    else 
      render :signup
    end
  end

  def show
    @user = User.find_by_id(session[:user_id])   
  end

  def logout
    reset_session
    redirect_to :action => 'index', notice: "you have logged out!"
  end

  def login
  end

  def authenticate
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])  
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: "successfully logged in!"
    else
      redirect_to :action => 'index', notice: "login failed!!!"
    end
  end

  private

  def signup_params
    params.require(:user).permit(:first_name, :last_name,:dob, :email, :password, :password_confirmation)
  end

end
