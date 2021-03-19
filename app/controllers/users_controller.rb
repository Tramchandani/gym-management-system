class UsersController < ApplicationController
  before_action :current_user
  skip_before_action :current_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save 
      session[:user_id] = @user.id
      flash[:notice] = "signup successful"
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show;  end

  def edit;  end

  def update
    if @user.update(user_update_params)
      flash[:notice] = "profile updated"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "profile updation failed"
      render :edit
    end
  end

  def edit_password;  end

  def update_password
    if @user&.authenticate(password_params[:current_password]) && confirm_update
      flash[:notice] = "password updated"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "password updation failed"
      render :edit_password
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :dob, :email, :password, :password_confirmation)
  end

  def user_update_params
    params.require(:user).permit(:first_name, :last_name, :dob, :email)
  end

  def password_params
    params.require(:user_pass).permit(:password, :password_confirmation, :current_password)
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end

  def confirm_update
    @user.update(password: password_params[:password], password_confirmation: password_params[:password_confirmation])
  end
end
