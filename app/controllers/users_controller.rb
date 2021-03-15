class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(signup_params) 
    if @user.save 
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: "signup successful"
    else 
      render :new
    end
  end

  def show
    @user = User.find_by_id(session[:user_id])   
  end

  private

  def signup_params
    params.require(:user).permit(:first_name, :last_name, :dob, :email, :password, :password_confirmation)
  end
end
