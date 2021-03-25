class UsersController < ApplicationController
  before_action :current_user, except: %i[new create]
  helper_method :flag

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
    render layout: 'empty'
  end

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

  def add_image; end

  def upload_image
    if @user.images.attach(image_params[:images])
      flash[:notice] = "image uploaded"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "image upload failed"
      render :add_image
    end
  end

  def all_images
    render layout: 'empty'
  end

  def delete_image
    @image =  ActiveStorage::Blob.find_signed(img_params[:id])
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

  def img_params
    params.permit(:id)
  end

  def confirm_update
    @user.update(password: password_params[:password], password_confirmation: password_params[:password_confirmation])
  end
end
