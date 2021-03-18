class UsersController < ApplicationController
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

  def show
    @user = current_user  
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    flash[:notice] = "updating profile"
    if @user.update(user_update_params)
      flash[:notice] = "profile updated"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "profile updation failed"
      render :edit
    end
  end

  def edit_password
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user&.authenticate(password_params[:current_password]) && @user.update(password: password_params[:password], password_confirmation: password_params[:password_confirmation])
      flash[:notice] = "password updated"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "password updation failed"
      render :edit_password
    end
  end

  def add_image; end

  def upload_image
    @user = current_user
    if @user.images.attach(image_params[:images])
      flash[:notice] = "image uploaded"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "image upload failed"
      render :add_image
    end
  end

  def all_images
    @user = current_user
    render layout: 'empty'
  end

  def delete_image
    @image =  ActiveStorage::Blob.find_signed(params[:id])
    @image.attachments.first.purge
    flash[:notice] = "image deleted"
    redirect_to all_images_path(session[:user_id])
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

  def image_params
    params.require(:add_user_img).permit(:images)
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
